@extends('layouts.master')

@section('title')
    Calendar
@endsection
@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Dashboard
        @endslot
        @slot('title')
            Calendar
        @endslot
    @endcomponent
    <div class="container-fluid">
        <div class="row ">
            <div class="col-12">
                <div class="text-sm-end">
                    <a href="{{ route('calendar') }}"
                        class="btn btn-primary btn-rounded waves-effect waves-light mb-2 me-2"><i class="bx bx-left-arrow-circle
                        me-1"></i>
                       Back</a>
                </div>
            </div>
            <table class="table table-primary table-striped" style="width: 100%">
                <thead>

                    <th class="text-center">Thu 22/2/2023</th>


                </thead>
            </table>
            <table class="table table-primary table-striped" style="width: 100%">
                <tbody>
                    <tr>
                        <td>#REFD34D9I</td>
                        <td>Yahya Bakleh</td>
                        <td>10 : 00 : 00</td>
                        <td> Car Wash </td>
                        <td> Pakages </td>
                        <td> 125 AED </td>
                        <td>Regular</td>
                        <td> KAMAL BALOCHI </td>


                    </tr><tr>
                        <td>#REFD34D9I</td>
                        <td>Yahya Bakleh</td>
                        <td>10 : 00 : 00</td>
                        <td> Car Wash </td>
                        <td> Pakages </td>
                        <td> 125 AED </td>
                        <td>Regular</td>
                        <td> KAMAL BALOCHI </td>


                    </tr><tr>
                        <td>#REFD34D9I</td>
                        <td>Yahya Bakleh</td>
                        <td>10 : 00 : 00</td>
                        <td> Car Wash </td>
                        <td> Pakages </td>
                        <td> 125 AED </td>
                        <td>Regular</td>
                        <td> KAMAL BALOCHI </td>


                    </tr><tr>
                        <td>#REFD34D9I</td>
                        <td>Yahya Bakleh</td>
                        <td>10 : 00 : 00</td>
                        <td> Car Wash </td>
                        <td> Pakages </td>
                        <td> 125 AED </td>
                        <td>Regular</td>
                        <td> KAMAL BALOCHI </td>


                    </tr><tr>
                        <td>#REFD34D9I</td>
                        <td>Yahya Bakleh</td>
                        <td>10 : 00 : 00</td>
                        <td> Car Wash </td>
                        <td> Pakages </td>
                        <td> 125 AED </td>
                        <td>Regular</td>
                        <td> KAMAL BALOCHI </td>


                    </tr><tr>
                        <td>#REFD34D9I</td>
                        <td>Yahya Bakleh</td>
                        <td>10 : 00 : 00</td>
                        <td> Car Wash </td>
                        <td> Pakages </td>
                        <td> 125 AED </td>
                        <td>Regular</td>
                        <td> KAMAL BALOCHI </td>


                    </tr>
                   
                </tbody>
            </table>
        </div>
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
