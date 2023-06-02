import { makeExtendSchemaPlugin, gql, embed } from 'graphile-utils';

const currentUserTopicFromContext = async (_args, context, _resolveInfo) => {
  return `graphql:user:1`;
};

export default makeExtendSchemaPlugin(({ pgSql: sql }) => ({
  typeDefs: gql`
      type UserSubscriptionPayload {
        
        user: User
  
        
        event: String
      }
  
      extend type Subscription {
        currentUserUpdated: UserSubscriptionPayload @pgSubscription(topic: ${embed(
          currentUserTopicFromContext,
        )})
      }
    `,

  resolvers: {
    UserSubscriptionPayload: {
      async user(
        event,
        _args,
        _context,
        { graphile: { selectGraphQLResultFromTable } },
      ) {
        const rows = await selectGraphQLResultFromTable(
          sql.fragment`tienda.user`,
          (tableAlias, sqlBuilder) => {
            sqlBuilder.where(
              sql.fragment`${tableAlias}.id = ${sql.value(event.subject)}`,
            );
          },
        );
        return rows[0];
      },
    },
  },
}));
