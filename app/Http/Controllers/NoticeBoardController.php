<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateNoticeBoardRequest;
use App\Http\Requests\UpdateNoticeBoardRequest;
use App\Models\NoticeBoard;
use App\Queries\NoticeBoardDataTable;
use App\Repositories\NoticeBoardRepository;
use DataTables;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Redirector;
use Illuminate\View\View;

class NoticeBoardController extends AppBaseController
{
    /** @var NoticeBoardRepository */
    private $noticeBoardRepository;

    public function __construct(NoticeBoardRepository $noticeBoardRepo)
    {
        $this->noticeBoardRepository = $noticeBoardRepo;
    }

    /**
     * Display a listing of the NoticeBoard.
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
            return Datatables::of((new NoticeBoardDataTable())->get())->make(true);
        }

        return view('notice_boards.index');
    }

    /**
     * Store a newly created NoticeBoard in storage.
     *
     * @param  CreateNoticeBoardRequest  $request
     *
     * @return JsonResponse
     */
    public function store(CreateNoticeBoardRequest $request)
    {
        $input = $request->all();
        $this->noticeBoardRepository->create($input);
        $this->noticeBoardRepository->createNotification();

        return $this->sendSuccess('Tablón de anuncio registrado con éxito.');
    }

    /**
     * @param  NoticeBoard  $noticeBoard
     *
     * @return Factory|RedirectResponse|Redirector|View
     */
    public function show($id)
    {
        $noticeBoard = NoticeBoard::findOrFail($id);

        return $this->sendResponse($noticeBoard, 'Notice Board retrieved successfully.');
    }

    /**
     * Show the form for editing the specified NoticeBoard.
     *
     * @param  NoticeBoard  $noticeBoard
     *
     * @return JsonResponse
     */
    public function edit(NoticeBoard $noticeBoard)
    {
        return $this->sendResponse($noticeBoard, 'Notice Board retrieved successfully.');
    }

    /**
     * @param  NoticeBoard  $noticeBoard
     * @param  UpdateNoticeBoardRequest  $request
     *
     * @return JsonResponse
     */
    public function update(NoticeBoard $noticeBoard, UpdateNoticeBoardRequest $request)
    {
        $this->noticeBoardRepository->update($request->all(), $noticeBoard->id);

        return $this->sendSuccess('Tablón de anuncio actualizado con éxito.');
    }

    /**
     * Remove the specified NoticeBoard from storage.
     *
     * @param  NoticeBoard  $noticeBoard
     *
     * @throws Exception
     *
     * @return JsonResponse
     */
    public function destroy(NoticeBoard $noticeBoard)
    {
        $noticeBoard->delete();

        return $this->sendSuccess('Notice Board deleted successfully.');
    }
}
