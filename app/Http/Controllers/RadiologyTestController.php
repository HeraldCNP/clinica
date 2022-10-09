<?php

namespace App\Http\Controllers;

use App\Exports\RadiologyTestExport;
use App\Http\Requests\CreateRadiologyTestRequest;
use App\Http\Requests\UpdateRadiologyTestRequest;
use App\Models\Charge;
use App\Models\RadiologyTest;
use App\Queries\RadiologyTestDataTable;
use App\Repositories\PatientRepository;
use App\Repositories\DoctorRepository;
use App\Repositories\RadiologyTestRepository;
use Barryvdh\DomPDF\Facade as PDF;
use DataTables;
use Exception;
use Flash;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Redirector;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class RadiologyTestController extends AppBaseController
{
    /** @var RadiologyTestRepository */
    private $radiologyTestRepository;
    private $patientRepository;
    private $doctorRepository;

    public function __construct(
        RadiologyTestRepository $radiologyTestRepo,
        PatientRepository $patientRepository,
        DoctorRepository $doctorRepository
    ) {
        $this->radiologyTestRepository = $radiologyTestRepo;
        $this->patientRepository = $patientRepository;
        $this->doctorRepository = $doctorRepository;
    }

    /**
     * Display a listing of the RadiologyTest.
     *
     * @param  Request  $request
     *
     * @throws Exception
     *
     * @return Factory|View
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            return Datatables::of((new RadiologyTestDataTable())->get())->make(true);
        }

        return view('radiology_tests.index');
    }

    /**
     * Show the form for creating a new RadiologyTest.
     *
     * @return Factory|View
     */
    public function create()
    {
        $data = $this->radiologyTestRepository->getRadiologyAssociatedData();
        $patients = $this->patientRepository->getPatients();
        $doctors = $this->doctorRepository->getDoctors();

        return view('radiology_tests.create', compact('data', 'patients', 'doctors'));
    }

    /**
     * Store a newly created RadiologyTest in storage.
     *
     * @param  CreateRadiologyTestRequest  $request
     *
     * @return RedirectResponse|Redirector
     */
    public function store(CreateRadiologyTestRequest $request)
    {
        $input = $request->all();
        //$input['standard_charge'] = removeCommaFromNumbers($input['standard_charge']);
        $input['report_days'] = ! empty($input['report_days']) ? $input['report_days'] : null;
        $input['subcategory'] = ! empty($input['subcategory']) ? $input['subcategory'] : null;
        $this->radiologyTestRepository->create($input);
        Flash::success('Radiología registrado con éxito.');

        return redirect(route('radiology.test.index'));
    }

    /**
     * Display the specified RadiologyTest.
     *
     * @param  RadiologyTest  $radiologyTest
     *
     * @return Factory|View
     */
    public function show(RadiologyTest $radiologyTest)
    {
        return view('radiology_tests.show', compact('radiologyTest'));
    }

    /**
     * Show the form for editing the specified RadiologyTest.
     *
     * @param  RadiologyTest  $radiologyTest
     *
     * @return Factory|View
     */
    public function edit(RadiologyTest $radiologyTest)
    {
        $data = $this->radiologyTestRepository->getRadiologyAssociatedData();
        $patients = $this->patientRepository->getPatients();
        $doctors = $this->doctorRepository->getDoctors();

        return view('radiology_tests.edit', compact('radiologyTest', 'data', 'patients', 'doctors'));
    }

    /**
     * Update the specified RadiologyTest in storage.
     *
     * @param  RadiologyTest  $radiologyTest
     * @param  UpdateRadiologyTestRequest  $request
     *
     * @return RedirectResponse|Redirector
     */
    public function update(RadiologyTest $radiologyTest, UpdateRadiologyTestRequest $request)
    {
        $input = $request->all();
        //$input['standard_charge'] = removeCommaFromNumbers($input['standard_charge']);
        $input['report_days'] = ! empty($input['report_days']) ? $input['report_days'] : null;
        $input['subcategory'] = ! empty($input['subcategory']) ? $input['subcategory'] : null;
        $this->radiologyTestRepository->update($input, $radiologyTest->id);
        Flash::success('Radiología actualizado con éxito.');

        return redirect(route('radiology.test.index'));
    }

    /**
     * Remove the specified RadiologyTest from storage.
     *
     * @param  RadiologyTest  $radiologyTest
     *
     * @throws Exception
     *
     * @return JsonResponse
     */
    public function destroy(RadiologyTest $radiologyTest)
    {
        $radiologyTest->delete();

        return $this->sendSuccess('Radiology Test deleted successfully.');
    }
    
    public function convertToPdf(RadiologyTest $radiologyTest)
    {
        //$data = $this->radiologyTestRepository->getSettingList();
        $data['radiologyTest'] = $radiologyTest;
        //$data['radiologyTests'] = $this->radiologyTestRepository->getRadiologyTestProperty($radiologyTest->id);

        $pdf = PDF::loadView('radiology_tests.radiology_test_pdf', $data);

        return $pdf->stream($radiologyTest->patient->user->full_name.'-'.$radiologyTest->test_type);
    }

    /**
     * @param $id
     *
     * @return mixed
     */
    public function getStandardCharge($id)
    {
        $standardCharges = Charge::where('charge_category_id', $id)->value('standard_charge');

        return $this->sendResponse($standardCharges, 'StandardCharge retrieved successfully.');
    }

    /**
     * @return BinaryFileResponse
     */
    public function radiologyTestExport()
    {
        return Excel::download(new RadiologyTestExport, 'radiology-tests-'.time().'.xlsx');
    }

    /**
     * @param  RadiologyTest  $radiologyTest
     *
     * @return JsonResponse
     */
    public function showModal(RadiologyTest $radiologyTest)
    {
        $radiologyTest->load(['radiologycategory', 'chargecategory']);
        
        return $this->sendResponse($radiologyTest, 'Radiology Test Retrieved Successfully.');
    }
}
