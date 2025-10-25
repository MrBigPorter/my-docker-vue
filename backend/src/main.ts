import { NestFactory } from '@nestjs/core';
import { Module, Controller, Get } from '@nestjs/common';

@Controller('api')
class AppController {
    @Get('hello')
    getHello() {
        return { message: 'Hello from NestJS + Docker!11' };
    }

    @Get('healthz')
    healthCheck() {
        return { message: 'healthz===>ok' };
    }
}

@Module({ controllers: [AppController] })
class AppModule {}

async function bootstrap() {
    const app = await NestFactory.create(AppModule);
    const port = process.env.PORT || 3000;
    await app.listen(port, '0.0.0.0');
}
bootstrap();