<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RedirectIfNotuser
{
    public function handle($request, Closure $next, $guard = "user")
    {
        if (!auth()->guard($guard)->check()) {
            return redirect(route('login'));
        }
        return $next($request);
    }
}
