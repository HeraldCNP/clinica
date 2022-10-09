<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "//www.w3.org/TR/html4/strict.dtd">
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="icon" href="{{ asset('web/img/logo.jpg') }}" type="image/png">
    <title>Radiology Test Report</title>
    <link href="{{ asset('assets/css/radiology-test-pdf.css') }}" rel="stylesheet" type="text/css"/>
</head>
<body>
<table width="100%">
    <tr>
        <td class="header-left">
            <div class="main-heading">Orden de Radiología</div>
            <div class="invoice-number font-color-gray">Diagnóstico Presuntivo:
                 {{ $radiologyTest->test_name }}</div>
        </td>
        <td class="header-right">
            <div class="header_image">
                 <img width="100px" src="{{ asset('web/img/logo-ok.jpg') }}">
            </div>
            <div class="hospital-name">{{ 'Centro Médico Vital' }}</div>
            <div class="phone-name">{{ '62-45098' }}</div>
            <div class="hospital-name font-color-gray">{{ 'H. Players N° 421 "A"' }}</div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table class="address">
                <tr>
                    <td>
                        <span class="font-weight-bold patient-detail-heading">Fecha de Informe:</span>
                        {{ \Carbon\Carbon::parse($radiologyTest->created_at)->format('j M, Y g:i A') }}
                    </td>
                </tr>
                <tr>
                    <td colspan="2"
                        class="font-weight-bold patient-detail-heading">Detalles del Paciente:
                    </td>
                </tr>
                <tr>
                    <td class="patient-details">
                        <table class="patient-detail-one">
                            <tr>
                                <td class="font-weight-bold">{{ __('messages.investigation_report.patient') }}:</td>
                                <td>{{ $radiologyTest->patient->user->full_name }}</td>
                            </tr>
                            <!--<tr>
                                <td class="font-weight-bold">{{ __('messages.user.email') }}:</td>
                                <td>{{ $radiologyTest->patient->user->email }}</td>
                            </tr>-->
                            <!--<<tr>
                                <td class="font-weight-bold">{{ __('Teléfono/Cel.') }}:</td>
                                <td>{{ !empty($radiologyTest->patient->user->phone)  ? $radiologyTest->patient->user->phone : 'N/A' }}</td>
                            </tr>-->
                            <tr>
                                <td class="font-weight-bold">{{ __('messages.user.gender') }}:</td>
                                <td>{{ $radiologyTest->patient->user->gender == 0 ? 'Masculino' : 'Femenino' }}</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">{{ __('Exámenes') }}:</td>
                                <td> {{ $radiologyTest->test_type }}</td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table class="patient-detail-two">
                            <tr>
                                <td class="font-weight-bold">{{ __('messages.investigation_report.doctor') }}:</td>
                                <td>{{ $radiologyTest->doctor->user->full_name }}</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">{{ __('Categoría') }}
                                    :
                                </td>
                                <td> {{ $radiologyTest->radiologycategory->name }}</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!--<tr>
        <td colspan="2">
            <table class="items-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Radiology Property Name</th>
                    <th>Radiology Property Value</th>
                </tr>
                </thead>
                <tbody>
                @if(isset($radiologyTests))
                    @foreach($radiologyTests as $key => $radiologyTest)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>{{ str_replace("_"," ",Str::title($radiologyTest->property_name)) }}</td>
                            <td>{{ !empty($radiologyTest->property_value)?$radiologyTest->property_value:'N/A' }}</td>
                        </tr>
                    @endforeach
                @endif
                </tbody>
            </table>
        </td>
    </tr>-->
</table>
</body>

