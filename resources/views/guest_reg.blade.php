@extends('layouts.master-without-nav')

@section('title')
   Guest Access
@endsection

@section('body')

    <body>
    @endsection

    @section('content')
        <div class="account-pages my-5 pt-sm-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card overflow-hidden">
                            <div class="bg-primary bg-soft">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="text-primary p-4">
                                            <h5 class="text-primary">Welcome To Suite Life Access System !</h5>
                                            <p>You are now on guest mode</p>
                                        </div>
                                    </div>
                                    <div class="col-5 align-self-end">
                                        <img src="{{ URL::asset('/assets/images/profile-img.png') }}" alt=""
                                            class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div class="auth-logo">
                                    <a href="index" class="auth-logo-light">
                                        <div class="avatar-md profile-user-wid mb-4">
                                            <span class="avatar-title rounded-circle bg-light">
                                                <img src="{{ URL::asset('/assets/images/logo-light.svg') }}" alt=""
                                                    class="rounded-circle" height="34">
                                            </span>
                                        </div>
                                    </a>

                                    <a href="index" class="auth-logo-dark">
                                        <div class="avatar-md profile-user-wid mb-4">
                                            <span class="avatar-title rounded-circle bg-light">
                                                <img src="{{ URL::asset('/assets/images/logo.png') }}" alt=""
                                                    class="rounded-circle" height="34">
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <form class="form-horizontal" method="POST" action="{{ route('guest.register') }}">
                                        @csrf
                                        <div class="mb-3">
                                            <label for="username" class="form-label">name</label>
                                            <input name="name" type="text"
                                                class="form-control @error('name') is-invalid @enderror"
                                                value="{{ old('name', '') }}" id="username" placeholder="Enter Name"
                                                autofocus required>
                                            @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="username" class="form-label">Email</label>
                                            <input name="email" type="email"
                                                class="form-control @error('email') is-invalid @enderror"
                                                value="{{ old('email', '') }}" id="username" placeholder="Enter Email"
                                                autocomplete="email" autofocus required>
                                            @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <input type="text" name="id1" hidden value="{{ $id1 }}">
                                        <input type="text" name="id2" hidden value="{{ $id2 }}">
                                        <div class="mb-3">
                                            <label class="form-label">Phone</label>
                                            <div
                                                class="input-group auth-pass-inputgroup @error('phone') is-invalid @enderror">
                                                <input type="text" name="phone"
                                                    class="form-control  @error('phone') is-invalid @enderror"
                                                    placeholder="Enter phone" required>

                                                @error('phone')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
 <div class="mb-3">
      <label class="form-label">Type </label>
    <select name="type" class="form-control" required>
        <option>Select</option>
        <option value="private">private</option>
        <option value="business">business</option>
     </select>
     </div>


                                        <div class="mt-3 d-grid">
                                            <button class="btn btn-primary waves-effect waves-light" type="submit">Generate
                                                Qr Code For Entrance</button>
                                        </div>

                                       
                                    </form>
                                </div>

                            </div>
                        </div>
                        <div class="mt-5 text-center">

                            <div>

                                <p>©
                                    <script>
                                        document.write(new Date().getFullYear())
                                    </script> Suite Life. Crafted with <i
                                        class="mdi mdi-heart text-danger"></i>
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- end account-pages -->
    @endsection
