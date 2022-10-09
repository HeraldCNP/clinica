<div class="row">
    <div class="col-md-4">
        <div class="form-group mb-5">
            {{ Form::label('patient_id', __('messages.pathology_test.patient').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('patient_id', $patients, isset($patientPathologyTest)?$patientPathologyTest->patient_id:null, ['class' => 'form-control form-control-solid','required','id' => 'patient_id','placeholder'=>'Seleccionar Paciente']) }}
        </div>
    </div>
    @if(Auth::user()->hasRole('Doctor'))
        <input type="hidden" name="doctor_id" value="{{ Auth::user()->owner_id }}">
    @else
        <div class="form-group col-md-4">
            {{ Form::label('doctor_id', __('messages.pathology_test.doctor').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('doctor_id', $doctors, isset($patientPathologyTest)?$patientPathologyTest->doctor_id:null, ['class' => 'form-control form-control-solid','required','id' => 'doctor_id','placeholder'=>'Seleccionar Médico']) }}
        </div>
    @endif
    <div class="col-md-4">
        <div class="form-group mb-5">
            {{ Form::label('category_id', __('messages.pathology_test.category_name').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('category_id',$data['pathologyCategories'], null, ['class' => 'form-select form-select-solid','required','id' => 'categoryName','placeholder'=>'Seleccionar Categoría','required']) }}
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group mb-5">
            {{ Form::label('test_name', __('messages.pathology_test.test_name').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('test_name', null, ['class' => 'form-control form-control-solid','required']) }}
        </div>
    </div>
    <div class="col-md-8">
        <div class="form-group mb-5">
            {{ Form::label('test_type', __('messages.pathology_test.test_type').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::textarea('test_type', null, ['class' => 'form-control form-control-solid','required', 'rows' => 4]) }}
        </div>
    </div>
    <!--<div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('short_name', __('messages.pathology_test.short_name').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('short_name', null, ['class' => 'form-control form-control-solid','required']) }}
        </div>
    </div>-->
    <!--<div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('unit', __('messages.pathology_test.unit').':',['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('unit', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>-->
    <!--<div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('subcategory', __('messages.pathology_test.subcategory').':',['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('subcategory', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>-->
    <!--<div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('method', __('messages.pathology_test.method').':',['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::text('method', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>-->
    <div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('report_days', __('messages.pathology_test.report_days').':',['class' => 'form-label fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::number('report_days', null, ['class' => 'form-control form-control-solid']) }}
        </div>
    </div>
    <!--<div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('charge_category_id', __('messages.pathology_test.charge_category').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            {{ Form::select('charge_category_id',$data['chargeCategories'], null, ['class' => 'form-select form-select-solid','required','id' => 'chargeCategory','placeholder'=>'Select Charge Category','required']) }}
        </div>
    </div>-->
    <!--<div class="col-md-3">
        <div class="form-group mb-5">
            {{ Form::label('standard_charge', __('messages.pathology_test.standard_charge').':',['class' => 'form-label required fs-6 fw-bolder text-gray-700 mb-3']) }}
            (<b>{{ getCurrencySymbol() }}</b>)
            {{ Form::text('standard_charge', null, ['class' => 'form-control price-input form-control-solid', 'id' => 'standardCharge', 'readonly', 'required']) }}
        </div>
    </div>-->
    <hr>
    <div class="col-md-12">
        <div class="d-flex mt-5">
            {{ Form::submit(__('messages.common.save'), ['class' => 'btn btn-primary me-3']) }}
            <a href="{{ route('pathology.test.index') }}"
               class="btn btn-light btn-active-light-primary me-2">{{ __('messages.common.cancel') }}</a>
        </div>
    </div>
</div>
