import { postgraphile, makePluginHook } from 'postgraphile';
import MySubscriptionPlugin from './MySubscriptionPlugin';
import PgPubsub from '@graphile/pg-pubsub';

const pluginHook = makePluginHook([PgPubsub]);
const middleware = postgraphile(
  process.env.DATABASE_URL ||
    'postgres://postgres:chouaib01mol@localhost/tienda-de-la-primavera2',
  'tienda',
  {
    pluginHook,
    enableCors: true,
    subscriptions: true,
    watchPg: true,
    dynamicJson: true,
    setofFunctionsContainNulls: false,
    ignoreRBAC: false,
    showErrorStack: 'json',
    extendedErrors: ['hint', 'detail', 'errcode'],
    appendPlugins: [
      require('@graphile-contrib/pg-simplify-inflector'),
      MySubscriptionPlugin,
    ],
    exportGqlSchemaPath: 'schema.graphql',
    graphiql: true,
    enhanceGraphiql: true,
    pgDefaultRole: 'tienda2_anonymous',
    allowExplain(req) {
      // TODO: customise condition!
      return true;
    },
    classicIds: true,
    jwtPgTypeIdentifier: 'tienda.jwt',
    jwtSecret: 'secret_for_jwts',
    enableQueryBatching: true,
    legacyRelations: 'omit',
    websocketMiddlewares: [
      // Add whatever middlewares you need here, note that they should only
      // manipulate properties on req/res, they must not sent response data. e.g.:
      //
      //   require('express-session')(),
      //   require('passport').initialize(),
      //   require('passport').session(),
    ],
  },
);
export default middleware;
