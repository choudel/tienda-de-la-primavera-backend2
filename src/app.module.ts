import { Module } from '@nestjs/common';
import { PostGraphileController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [],
  controllers: [PostGraphileController],
  providers: [AppService],
})
export class AppModule {}
