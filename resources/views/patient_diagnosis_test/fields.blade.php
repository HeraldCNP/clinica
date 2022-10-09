<div class="row gx-10 mb-5">
    <div class="col-lg-4 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('patient_id', __('messages.patient_diagnosis_test.patient').':', ['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('patient_id', $patients, isset($patientDiagnosisTest)?$patientDiagnosisTest->patient_id:null, ['class' => 'form-select form-select-solid', 'required', 'id' => 'patient_id', 'placeholder' => 'Seleccionar Paciente', 'data-control' => 'select2']) }}
        </div>
    </div>
    @if(Auth::user()->hasRole('Doctor'))
        <input type="hidden" name="doctor_id" value="{{ Auth::user()->owner_id }}">
    @else
        <div class="form-group col-md-4">
            {{ Form::label('doctor_id', __('messages.patient_diagnosis_test.doctor').':', ['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('doctor_id', $doctors, isset($patientDiagnosisTest)?$patientDiagnosisTest->doctor_id:null, ['class' => 'form-select form-select-solid','required','id' => 'doctor_id','placeholder'=>'Seleccionar Médico', 'data-control' => 'select2']) }}
        </div>
    @endif
    <div class="col-lg-4 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('category_id', __('messages.patient_diagnosis_test.diagnosis_category').':', ['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('category_id', $diagnosisCategory, isset($patientDiagnosisTest)?$patientDiagnosisTest->category_id:null, ['class' => 'form-select form-select-solid', 'required', 'id' => 'category_id', 'data-control' => 'select2', 'placeholder' => 'Seleccionar Categoría']) }}
        </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('report_number', __('messages.patient_diagnosis_test.report_number').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('report_number', isset($patientDiagnosisTest)?$patientDiagnosisTest->report_number:$reportNumber, ['class' => 'form-control form-control-solid', 'readonly']) }}
        </div>
    </div>
    <hr>
    <u>
    <div class="col-md-12 mb-3">
        <h5>{{ __('ANTECEDENTES PERSONALES') }}</h5>
    </div><br>
    </u>
    <div class="col-lg-2 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('blood type', __('Tipo de sangre').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('Tipo de sangre', null, ['class' => 'form-control form-control-solid', 'placeholder'=>'Grupo/Factor']) }}
        </div>
    </div>
    <div class="col-lg-5 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('allergies', __('Alergias').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('Alergias', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-5 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('prevalent surgical pathologies', __('Patologías prevalentes/Cirugías').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('Patologías prevalentes/Cirugias', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-2 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('ege', __('messages.patient_diagnosis_test.age').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('Edad', null, ['class' => 'form-control form-control-solid', 'min' => '1', 'max' => '100']) }}
        </div>
    </div>
    <div class="col-lg-5 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('Medications you use', __('Medicamentos que utiliza').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('Medicamentos que utiliza', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-5 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('observations', __('Observaciones').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::textarea('Observaciones', null, ['class' => 'form-control form-control-solid','rows'=>'2']) }}
        </div>
    </div>
    <hr>
    <u>
    <div class="col-md-12 mb-3">
        <h5>{{ __('EXAMEN FÍSICO GENERAL') }}</h5>
    </div><br>
    </u>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('blood_pressure', __('messages.patient_diagnosis_test.blood_pressure').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('Presión arterial', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('heart rate', __('F.C.').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('FC', null, ['class' => 'form-control form-control-solid', 'min' => '1', 'max' => '200','placeholder'=>'lat/min']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('Breathing frequency', __('F.R.').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('FR', null, ['class' => 'form-control form-control-solid', 'min' => '1', 'max' => '200','placeholder'=>'res/min']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('temperature', __('Temperatura').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('Temperatura', null, ['class' => 'form-control form-control-solid', 'min' => '1', 'max' => '100','placeholder'=>'T°']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('weight', __('messages.patient_diagnosis_test.weight').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('Peso', null, ['class' => 'form-control floatNumber form-control-solid', 'data-mask'=>'##0,00', 'max' => '200', 'step' => '.01', 'placeholder'=>'kg']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('height', __('messages.patient_diagnosis_test.height').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('Talla', null, ['class' => 'form-control floatNumber form-control-solid', 'max' => '7', 'min' => '1' , 'step' => '.01','placeholder'=>'cm']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('imc', __('I.M.C.').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('IMC', null, ['class' => 'form-control floatNumber form-control-solid', 'max' => '7', 'min' => '1' , 'step' => '.01','placeholder'=>'peso/talla 2']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('note', __('Nota').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::textarea('Nota', null, ['class' => 'form-control form-control-solid','rows'=>'2']) }}
        </div>
    </div>
    <!--<div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('average_glucose', __('messages.patient_diagnosis_test.average_glucose').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('average_glucose', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('fasting_blood_sugar', __('messages.patient_diagnosis_test.fasting_blood_sugar').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('fasting_blood_sugar', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('urine_sugar', __('messages.patient_diagnosis_test.urine_sugar').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('urine_sugar', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('diabetes', __('messages.patient_diagnosis_test.diabetes').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('diabetes', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mb-5">
            {{ Form::label('cholesterol', __('messages.patient_diagnosis_test.cholesterol').':', ['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('cholesterol', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>-->
    <hr>
    <div class="col-sm-12 mt-3">
        <div class="mb-3 h5">
            {{__('messages.patient_diagnosis_test.add_other_diagnosis_property')}}
        </div>
        <table class="table table-responsive-sm align-middle table-row-dashed fs-6 gy-5 dataTable no-footer w-100" id="patientDiagnosisTestTbl">
            <thead class="thead-dark">
            <tr class="text-start text-muted fw-bolder fs-7 text-uppercase gs-0">
                <th class="text-center">#</th>
                <th class="diagnoses-filed">{{__('messages.patient_diagnosis_test.diagnosis_property_name')}}
                </th>
                <th class="diagnoses-filed">{{__('messages.patient_diagnosis_test.diagnosis_property_value')}}
                </th>
                <th class="text-center">
                    <button type="button" class="btn btn-sm btn-primary float-right w-80"
                            id="addItem">{{ __('messages.common.add') }}</button>
                </th>
            </tr>
            </thead>
            <tbody class="diagnosis-item-container text-gray-600 fw-bold">
            </tbody>
        </table>
    </div>
</div>
<hr>
<div class="d-flex">
    {!! Form::submit(__('messages.common.save'), ['class' => 'btn btn-primary me-3','id' => 'saveBtn']) !!}
    <a href="{{ route('patient.diagnosis.test.index') }}"
       class="btn btn-light btn-active-light-primary me-2">{!! __('messages.common.cancel') !!}</a>
</div>
