<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="title" content="{{config('app.name')}}">

    <meta name="keywords" content="{{getCompanyName()}}"/>

    <meta name="description" content="{{getAppName()}}"/>
    <meta name="author" content="{{getCompanyName()}}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ getSettingValue('favicon') }}" type="image/png">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Email Verification | {{ config('app.name') }}</title>

    <link href="{{ asset('backend/css/vendor.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('backend/css/datatables.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('backend/css/fonts.css') }}" rel="stylesheet" type="text/css"/>
    @yield('page_css')
    <link href="{{ asset('backend/css/3rd-party.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('backend/css/3rd-party-custom.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ mix('assets/css/custom.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ mix('assets/css/custom.css') }}" rel="stylesheet" type="text/css"/>
</head>
<body class="d-flex ">
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-column flex-center flex-column-fluid p-10">
        @if (session('resent'))
            <p class="alert alert-success" role="alert">Se ha enviado un nuevo enlace de verificación a su dirección de correo electrónico.</p>
        @endif
        <img src="{{ asset('web/img/verification.png') }}" class="mw-100 mb-10 h-lg-450px">
        <h1 class="fw-bold mb-10">Verifique su dirección de correo electrónico</h1>
        <span class="mb-5 fw-bold fs-3">Antes de continuar, verifique su correo electrónico para obtener un enlace de verificación. Si no recibió el correo electrónico,</span>
        <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
            @csrf
            <button type="submit" class="btn btn-primary mt-3">
                haga clic aquí para solicitar otro
            </button>
        </form>
        {{--        <a class="btn btn-primary mt-3" href="#" onclick="window.history.back();">Back to Previous Page</a>--}}
    </div>
</div>
<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
<script src="{{ asset('assets/js/popper.min.js') }}"></script>
</body>
</html>
