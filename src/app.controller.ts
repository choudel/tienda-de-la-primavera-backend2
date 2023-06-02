import { Controller, Get, Post, Req, Next, Res } from '@nestjs/common';
import { Request, Response } from 'express';
import { PostGraphileResponseNode } from 'postgraphile';
import middleware from 'src/postgraphile.middleware';

@Controller('/')
export class PostGraphileController {
  @Get(middleware.graphiqlRoute)
  graphiql(@Req() request: Request, @Res() response: Response, @Next() next) {
    middleware.graphiqlRouteHandler(
      new PostGraphileResponseNode(request, response, next),
    );
  }

  @Post(middleware.graphqlRoute)
  graphql(@Req() request: Request, @Res() response: Response, @Next() next) {
    middleware.graphqlRouteHandler(
      new PostGraphileResponseNode(request, response, next),
    );
  }
}
