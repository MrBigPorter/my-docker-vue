import { NestFactory } from '@nestjs/core';
import { Module, Controller, Get } from '@nestjs/common';

@Controller('api')
class AppController {
    @Get('hello')
    getHello() {
        return { message: 'Hello from NestJS + Docker! ✅' };
    }

    @Get('healthz')
    healthCheck() {
        return { status: 'ok ✅' };
    }
}

@Module({ controllers: [AppController] })
class AppModule {}

async function bootstrap() {
    const app = await NestFactory.create(AppModule);

    // ✅ 允许跨域 (前端才能访问)
    app.enableCors();

    const port = process.env.PORT || 3000;
    await app.listen(port, '0.0.0.0');
    console.log(`✅ Backend running on http://localhost:${port}`);
}
bootstrap();