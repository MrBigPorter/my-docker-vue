import { NestFactory } from '@nestjs/core';
import { Module, Controller, Get } from '@nestjs/common';

@Controller('api')
class AppController {
    @Get('hello')
    getHello() {
        return { message: 'Hello from NestJS + Docker!11' };
    }
}

@Module({ controllers: [AppController] })
class AppModule {}

async function bootstrap() {
    const app = await NestFactory.create(AppModule);
    await app.listen(3000, '0.0.0.0');
}
bootstrap();