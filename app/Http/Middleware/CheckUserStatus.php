<?php

namespace App\Http\Middleware;

use Auth;
use Closure;
use Flash;

class CheckUserStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $response = $next($request);

        if (Auth::check() && ! $request->user()->status) {
            Auth::logout();
            Flash::error('Su cuenta está deshabilitada actualmente, comuníquese con el administrador.');

            return redirect()->back();
        }

        return $response;
    }
}
