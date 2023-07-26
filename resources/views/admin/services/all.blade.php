@extends('layouts.master')

@section('title')
    @lang('translation.Task_List')
@endsection

@section('css')
    <!-- Lightbox css -->
    <link href="{{ URL::asset('/assets/libs/magnific-popup/magnific-popup.min.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            services
        @endslot
        @slot('title')
            show
        @endslot
    @endcomponent
    @if (Session::has('success'))
        <div class="alert alert-success">
            {{ Session::get('success') }}
        </div>
    @endif
    @if ($errors->any())
        {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}
    @endif
    <div class="row">
        <div class="col-12">
            <div class="text-sm-end">
                <a href="{{ route('services.index') }}"
                    class="btn btn-outline-primary btn-rounded waves-effect waves-light mb-2 me-2"><i
                        class="bx bx-left-arrow-alt me-1"></i>
                    Back</a>
            </div>
        </div>
    </div>
    {{-- <div class="row">
        <div class="col-6 p-3">
            <div>
                <a class="popup-form btn btn-primary" href="#add-staff"><i class="mdi mdi-plus me-1"></i> Add New
                    staff</a>
            </div>

            <div class="card mfp-hide mfp-popup-form mx-auto" id="add-staff">
                <div class="card-body">
                    <h4 class="mt-0 mb-4">Add New staff</h4>
                    <form class="needs-validation" action="{{ route('staff.store.show') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Name</label>
                                    <input type="text"
                                        class="form-control @error('name')
                                        
                                    @enderror"
                                        name="name" id="validationCustom01" placeholder="name"
                                        value="{{ old('name', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom02" class="form-label">E-mail</label>
                                    <input type="email"
                                        class="form-control @error('email')
                                        
                                    @enderror"
                                        id="validationCustom02" placeholder="email" name="email"
                                        value="{{ old('email', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3 position-relative">
                                    <label for="validationTooltipstaffname" class="form-label">Phone Number</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"
                                                id="validationTooltipstaffnamePrepend">+971</span>
                                        </div>
                                        <input type="text" name="phone"
                                            class="form-control @error('phone') invalid
                                            
                                        @enderror"
                                            placeholder="Phone Number" value="{{ old('phone', '') }}" required>
                                        <div class="invalid-tooltip">
                                            Please choose a unique and valid Phone Number.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom02" class="form-label">rate</label>
                                    <input type="number" min="0" max="5"
                                        class="form-control @error('appartment_number')
                                        
                                    @enderror"
                                        id="validationCustom02" placeholder="staff rate 1 to 5" name="rate"
                                        value="{{ old('rate', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <input type="text" value="{{ $service->id }}" name="service_id" style="display: none;">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Password</label>
                                    <input type="password"
                                        class="form-control @error('password')
                                        
                                    @enderror"
                                        name="password" id="validationCustom01" placeholder="password" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom02" class="form-label">Confirm password</label>
                                    <input type="password" placeholder="Confirm password"
                                        class="form-control @error('password_confirmation')
                                        invalid
                                    @enderror"
                                        id="validationCustom02" placeholder="confirm the password"
                                        name="password_confirmation" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>

                        </div>
                        <button class="btn btn-primary" type="submit">save</button>


                    </form>
                </div>

            </div>
        </div>

        <div class="col-6 p-3">
            <div>
                <a class="popup-form btn btn-dark" href="#add-category"><i class="mdi mdi-plus me-1"></i> Add New
                    category</a>
            </div>

            <div class="card mfp-hide mfp-popup-form mx-auto" id="add-category">
                <div class="card-body">
                    <h4 class="mt-0 mb-4">Add New category</h4>
                    <form class="needs-validation" action="{{ route('categories.store.show') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Name</label>
                                    <input type="text"
                                        class="form-control @error('name')
                                        
                                    @enderror"
                                        name="name" id="validationCustom01" placeholder="name"
                                        value="{{ old('name', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="text" value="{{ $service->id }}" name="service_id" style="display: none;">

                        <button class="btn btn-primary" type="submit">save</button>
                        <a href="{{ route('categories.index') }}" class="btn"
                            style="background-color: gray;color:white">cancel</a>
                </div>
                </form>
            </div>
        </div>
    </div> --}}
    <div class="row">
        <div class="col-6">
            <div class="row">
                <div class="col-12">
                    <div class="card p-3">
                        <div class="card-body">
                            <h2 class="card-title mb-4 text-center">
                                {{ $service->name }}
                            </h2>
                            <div class="d-flex justify-content-center">
                                <img src="{{ url($service->picture_path) }}" alt="" srcset="" height="200px"
                                    style="display: block;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    @foreach ($staff as $person)
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title mb-4">{{ $person->name }}</h4>


                                <div class="table-responsive">
                                    <table class="table table-nowrap align-middle mb-0">
                                        <tbody>

                                            {{-- ------------------------------------------------- --}}

                                            <tr>
                                                <td>{{ $person->name }}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ $person->email }}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ $person->phone }}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    @for ($i = 0; $i < $person->rate; $i++)
                                                        <i class="bx bxs-star text-warning"></i>
                                                    @endfor


                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    @if ($person->status == 0)
                                                        <span
                                                            class="badge badge-pill badge-soft-success font-size-12">Available</span>
                                                    @else
                                                        <span
                                                            class="badge badge-pill badge-soft-danger font-size-12">Hired</span>
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="{{ route('staff.edit', $person->id) }}"
                                                        class="btn btn-warning">Edit</a>
                                                    <form action="{{ route('staff.destroy', $person->id) }}"
                                                        method="post" style="display: inline">
                                                        @csrf
                                                        @method('delete')
                                                        <button type="submit"
                                                            class="btn btn-xs btn-danger btn-flat show_confirm"
                                                            data-toggle="tooltip" title='Delete'>Delete</button>

                                                    </form>
                                                </td>
                                            </tr>
                                            {{-- ------------------------------------------------- --}}


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- end col -->
                    @endforeach
                </div>
            </div>
        </div>

        <div class="col-6">


            {{-- ----------------------------------------------------------------- --}}
            @foreach ($categories as $category)
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4">{{ $category->name }}</h4>

                            <a href="{{ route('categories.edit', $category->id) }}" class="btn btn-warning">Edit</a>
                            <form action="{{ route('categories.destroy', $category->id) }}" method="post"
                                style="display: inline">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-xs btn-danger btn-flat show_confirm"
                                    data-toggle="tooltip" title='Delete'>Delete</button>

                            </form>
                            <div class="table-responsive">
                                <table class="table table-nowrap align-middle mb-0">
                                    <tbody>

                                        {{-- ------------------------------------------------- --}}
                                        @foreach ($subServices as $subService)
                                            @if ($category->id == $subService->category_id)
                                                <tr>
                                                    <td>
                                                        <h5 class="text-truncate font-size-14 m-0"><a href="#"
                                                                class="text-dark">{{ $subService->name }}</a></h5>
                                                    </td>
                                                    <td>
                                                        <h5 class="text-truncate font-size-14 m-0"><a href="#"
                                                                class="text-dark">{{ $subService->price }}</a> AED</h5>
                                                    </td>
                                                    <td>


                                                    </td>
                                                    <td>
                                                        <a href="{{ route('subServices.edit', $subService->id) }}"
                                                            class="btn btn-warning">edit</a>
                                                        <form action="{{ route('subServices.destroy', $subService->id) }}"
                                                            method="post" style="display: inline">
                                                            @csrf
                                                            @method('delete')
                                                            <button type="submit"
                                                                class="btn btn-xs btn-danger btn-flat show_confirm"
                                                                data-toggle="tooltip" title='Delete'>Delete</button>
                                                        </form>
                                                        {{-- <button class="btn btn-danger" id="delete">Delete</button> --}}
                                                    </td>
                                                </tr>
                                            @endif
                                        @endforeach
                                        {{-- <tr>
                                            <td>
                                                <div>
                                                    <a class="popup-form btn btn-success"
                                                        href="#add-subservices-{{ $category->id }}"><i
                                                            class="mdi mdi-plus me-1"></i> Add New subService</a>
                                                </div>

                                                <div class="card mfp-hide mfp-popup-form mx-auto"
                                                    id="add-subservices-{{ $category->id }}">
                                                    <div class="card-body">
                                                        <h4 class="mt-0 mb-4">Add New subService</h4>
                                                        <form class="needs-validation"
                                                            action="{{ route('subServices.store.show') }}"
                                                            method="POST">
                                                            @csrf
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="validationCustom01"
                                                                            class="form-label">
                                                                            Name</label>
                                                                        <input type="text"
                                                                            class="form-control @error('name')
                                                                                
                                                                            @enderror"
                                                                            name="name" id="validationCustom01"
                                                                            placeholder="name"
                                                                            value="{{ old('name', '') }}" required>
                                                                        <div class="valid-feedback">
                                                                            Looks good!
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label for="validationCustom02"
                                                                            class="form-label">price</label>
                                                                        <input type="text"
                                                                            class="form-control @error('price')
                                                                                
                                                                            @enderror"
                                                                            id="validationCustom02" placeholder="price"
                                                                            name="price" value="{{ old('price', '') }}"
                                                                            required>
                                                                        <div class="valid-feedback">
                                                                            Looks good!
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <input type="text" name="category_id"
                                                                value="{{ $category->id }}" style="display: none">
                                                            <button class="btn btn-primary" type="submit">save</button>

                                                    </div>
                                                    </form>
                                                </div>


                                            </td>
                                        </tr> --}}

                                        {{-- ------------------------------------------------- --}}


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- end col -->
            @endforeach
            {{-- ----------------------------------------------------------------- --}}
        </div>
    </div>



    </div>
    <!-- end row -->
@endsection
@section('script')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script type="text/javascript">
        $('.show_confirm').click(function(event) {
            var form = $(this).closest("form");
            var name = $(this).data("name");
            event.preventDefault();
            swal({
                    title: `Are you sure you want to delete this record?`,
                    text: "if you delete this, it will affect other information on the system and may cause to delete them.  ",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                        form.submit();
                    }
                });
        });
    </script>
    <!-- Magnific Popup-->
    <script src="{{ URL::asset('/assets/libs/magnific-popup/magnific-popup.min.js') }}"></script>

    <!-- lightbox init js-->
    <script src="{{ URL::asset('/assets/js/pages/lightbox.init.js') }}"></script>
    <!-- apexcharts -->
    <script src="{{ URL::asset('/assets/libs/apexcharts/apexcharts.min.js') }}"></script>

    <!-- dashboard init -->
    <script src="{{ URL::asset('/assets/js/pages/tasklist.init.js') }}"></script>
@endsection
