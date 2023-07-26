@extends('layouts.master')

@section('title')
    Notification Mangment
@endsection

@section('css')
    <!-- DataTables -->
    <link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')

    @component('components.breadcrumb')
        @slot('li_1')
            Dashboard
        @endslot
        @slot('title')
            Notification Mangment
        @endslot
    @endcomponent
    @if (Session::has('success'))
        <div class="alert alert-success">
            {{ Session::get('success') }}
        </div>
    @endif
    @if (Session::has('fail'))
        <div class="alert alert-danger">
            {{ Session::get('fail') }}
        </div>
    @endif
    <!--  end row -->
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" action="{{route('notification.update')}}" method="POST">
                        @csrf
                        @method('put')
                        <div class="row">
                            <div class="col-12 bg-primary p-3 rounded ">
                                <h1 class="text-white text-center">This component of what the user recives the notafication</h1>
                            </div>
                        @foreach ($config as $item)
                           
                                <div class="col-4">
                                    <div class="mt-4">
                                        <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                            <input name="{{$item->event}}" class="form-check-input" type="checkbox"
                                                id="customCheckcolor1" @if ($item->notify == 1) checked @endif>
                                            <label class="form-check-label" for="customCheckcolor1">
                                                {{$item->event}}
                                            </label>
                                        </div>
                                    </div>
                                </div>
                           
                        @endforeach
                    </div>
                        <button class="btn btn-primary" type="submit">save</button>
                        <a href="{{ route('buildings.index') }}" class="btn"
                            style="background-color: gray;color:white">cancel</a>
                </div>
                </form>
            </div>
        </div>
        <!-- end card -->
    </div> <!-- end col -->
    </div> <!-- end row -->

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
    <!-- Required datatable js -->
    <script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js') }}"></script>
    <!-- Datatable init js -->
    <script src="{{ URL::asset('/assets/js/pages/datatables.init.js') }}"></script>
@endsection
