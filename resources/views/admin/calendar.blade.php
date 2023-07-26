@extends('layouts.master')


@section('title')
    Calendar
@endsection

@section('css')
    <style>
        body {
            font-family: Tahoma;
        }

        header {
            text-align: center;
        }

        #calendar {
            width: 100%;
        }

        #calendar a {
            color: #984e77;
            text-decoration: none;
        }

        #calendar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
        }

        #calendar li {
            display: block;
            float: left;
            width: 14.342%;
            padding: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            margin-right: -1px;
            margin-bottom: -1px;
        }

        #calendar ul.weekdays {
            height: 40px;
            background: #984e77;
        }

        #calendar ul.weekdays li {
            text-align: center;
            text-transform: uppercase;
            line-height: 20px;
            border: none !important;
            padding: 10px 6px;
            color: #fff;
            font-size: 13px;
        }

        #calendar .days li {
            height: 180px;
        }

        #calendar .days li:hover {
            background: #d3d3d3;
        }

        #calendar .date {
            text-align: center;
            margin-bottom: 5px;
            padding: 4px;
            background: #984e77;
            color: #fff;
            width: 26px;
            border-radius: 50%;
            float: right;
        }

        #calendar .event {
            clear: both;
            display: block;
            font-size: 13px;
            border-radius: 4px;
            padding: 5px;
            margin-top: 40px;
            margin-bottom: 5px;
            line-height: 14px;
            background: #e4f2f2;
            border: 1px solid #b5dbdc;
            color: #009aaf;
            text-decoration: none;
        }

        #calendar .done_event {
            clear: both;
            display: block;
            font-size: 13px;
            border-radius: 4px;
            padding: 5px;
            margin-top: 40px;
            margin-bottom: 5px;
            line-height: 14px;
            background: #727b7b;
            border: 1px solid #424646;
            color: #ffffff;
            text-decoration: none;
        }

        #calendar .event-desc {
            color: #666;
            margin: 3px 0 7px 0;
            text-decoration: none;
        }

        #calendar .done_event-desc {
            color: rgb(255, 255, 255);
            margin: 3px 0 7px 0;
            text-decoration: none;
        }

        #calendar .other-month {
            background: #f5f5f5;
            color: #666;
        }

        /* ============================
                                Mobile Responsiveness
                               ============================*/


        @media(max-width: 768px) {

            #calendar .weekdays,
            #calendar .other-month {
                display: none;
            }

            #calendar li {
                height: auto !important;
                border: 1px solid #ededed;
                width: 100%;
                padding: 10px;
                margin-bottom: -1px;
            }

            #calendar .date {
                float: none;
            }
        }
    </style>
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




    <div id="calendar-wrap" >
        <header>
            <h1>{{ date('M') }} {{ date('Y') }}</h1>
        </header>
        <div id="calendar" style="margin-bottom: 100px">
            {{-- <ul class="weekdays">
                <li>Sunday</li>
                <li>Monday</li>
                <li>Tuesday</li>
                <li>Wednesday</li>
                <li>Thursday</li>
                <li>Friday</li>
                <li>Saturday</li>
            </ul> --}}

            <!-- Days from previous month -->
            @for ($i = 0; $i < cal_days_in_month(CAL_GREGORIAN, date('m'), date('y')); $i++)
            @endfor
            <ul class="days">
                @foreach ($period as $item)
                    @if ($item->format('Y-m-d') == date('Y-m-d'))
                        <a href="{{ URL('/admin/daily/'.$item->format('Y-m-d')) }}">
                            <li class="day other-month bg-primary">
                                <div class="date"> {{ $item->format('d') }}</div>
                                <div class="btn btn-light text-primary">{{ $item->format('D') }}</div>
                                @php $x= App\Http\Controllers\admin\calendarController::get_orders($item->format('Y-m-d'));  @endphp
                                @if ($x > 0)
                                    <div class="event">
                                        @foreach ($services as $obj)
                                            <div class="event-time">
                                                {{ $obj->name }} : @php echo App\Http\Controllers\admin\calendarController::get_services_count($item->format('Y-m-d'),$obj->id);  @endphp
                                            </div>
                                        @endforeach


                                    </div>
                                @endif
                            </li>
                        </a>
                    @else
                        <a href="{{ URL('/admin/daily/'.$item->format('Y-m-d')) }}">
                            <li class="day other-month bg-dark  ">
                                <div class="date"> {{ $item->format('d') }}</div>
                                <div class="btn btn-primary text-white">{{ $item->format('D') }}</div>
                                @php $x= App\Http\Controllers\admin\calendarController::get_orders($item->format('Y-m-d'));  @endphp
                                @if ($x > 0)
                                    <div class="event">
                                        @foreach ($services as $obj)
                                            <div class="event-time">
                                                {{ $obj->name }} : @php echo App\Http\Controllers\admin\calendarController::get_services_count($item->format('Y-m-d'),$obj->id);  @endphp
                                            </div>
                                        @endforeach


                                    </div>
                                @endif
                            </li>
                        </a>
                    @endif

                    {{-- <li class="day other-month">
                        <div class="date">28</div>
                        <a href="">
                            <div class="done_event">
                                <div class="done_event-time">
                                    Car Wash : 3
                                </div>
                                <div class="done_event-time">
                                    car Reful: 6
                                </div>
                                <div class="done_event-time">
                                    Cleaning : 2
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="day other-month">
                        <div class="date">29</div>
                    </li>
                    <li class="day other-month">
                        <div class="date">30</div>
                    </li>
                    <li class="day other-month">
                        <div class="date">31</div>
                    </li>

                    <!-- Days in current month -->

                    <li class="day">
                        <div class="date">1</div>
                    </li>
                    <li class="day">
                        <div class="date">2</div>
                        <div class="event">
                            <div class="event-desc">
                                order number #wesdwas <br> order By user
                            </div>
                            <div class="event-time">
                                Team : Yahya Bakleh
                            </div>
                            <div class="event-time">
                                Timing : 1:00:00
                            </div>
                        </div>

                    </li> --}}
                @endforeach
            </ul>
            {{-- <!-- Row #2 -->

            <ul class="days">
                <li class="day">
                    <div class="date">3</div>
                </li>
                <li class="day">
                    <div class="date">4</div>
                </li>
                <li class="day">
                    <div class="date">5</div>
                </li>
                <li class="day">
                    <div class="date">6</div>
                </li>
                <li class="day">
                    <div class="date">7</div>
                    <div class="event">
                        <div class="event-desc">
                            order number #wesdwas <br> order By user
                        </div>
                        <div class="event-time">
                            Team : Yahya Bakleh
                        </div>
                        <div class="event-time">
                            Timing : 1:00:00
                        </div>
                    </div>
                </li>
                <li class="day">
                    <div class="date">8</div>
                </li>
                <li class="day">
                    <div class="date">9</div>
                </li>
            </ul>

            <!-- Row #3 -->

            <ul class="days">
                <li class="day">
                    <div class="date">10</div>
                </li>
                <li class="day">
                    <div class="date">11</div>
                </li>
                <li class="day">
                    <div class="date">12</div>
                </li>
                <li class="day">
                    <div class="date">13</div>
                </li>
                <li class="day">
                    <div class="date">14</div>
                    <div class="event">
                        <div class="event-desc">
                            order number #wesdwas <br> order By user
                        </div>
                        <div class="event-time">
                            Team : Yahya Bakleh
                        </div>
                        <div class="event-time">
                            Timing : 1:00:00
                        </div>
                    </div>
                </li>
                <li class="day">
                    <div class="date">15</div>
                </li>
                <li class="day">
                    <div class="date">16</div>
                </li>
            </ul>

            <!-- Row #4 -->

            <ul class="days">
                <li class="day">
                    <div class="date">17</div>
                </li>
                <li class="day">
                    <div class="date">18</div>
                </li>
                <li class="day">
                    <div class="date">19</div>
                </li>
                <li class="day">
                    <div class="date">20</div>
                </li>
                <li class="day">
                    <div class="date">21</div>
                </li>
                <li class="day">
                    <div class="date">22</div>
                    <div class="event">
                        <div class="event-desc">
                            order number #wesdwas <br> order By user
                        </div>
                        <div class="event-time">
                            Team : Yahya Bakleh
                        </div>
                        <div class="event-time">
                            Timing : 1:00:00
                        </div>
                    </div>
                </li>
                <li class="day">
                    <div class="date">23</div>
                </li>
            </ul>

            <!-- Row #5 -->

            <ul class="days">
                <li class="day">
                    <div class="date">24</div>
                </li>
                <li class="day">
                    <div class="date">25</div>
                    <div class="event">
                        <div class="event-desc">
                            order number #wesdwas <br> order By user
                        </div>
                        <div class="event-time">
                            Team : Yahya Bakleh
                        </div>
                        <div class="event-time">
                            Timing : 1:00:00
                        </div>
                    </div>
                </li>
                <li class="day">
                    <div class="date">26</div>
                </li>
                <li class="day">
                    <div class="date">27</div>
                </li>
                <li class="day">
                    <div class="date">28</div>
                </li>
                <li class="day">
                    <div class="date">29</div>
                </li>
                <li class="day">
                    <div class="date">30</div>
                </li>
            </ul>

            <!-- Row #6 -->

            <ul class="days">
                <li class="day">
                    <div class="date">31</div>
                </li>
                <li class="day other-month">
                    <div class="date">1</div> <!-- Next Month -->
                </li>
                <li class="day other-month">
                    <div class="date">2</div>
                </li>
                <li class="day other-month">
                    <div class="date">3</div>
                </li>
                <li class="day other-month">
                    <div class="date">4</div>
                </li>
                <li class="day other-month">
                    <div class="date">5</div>
                </li>
                <li class="day other-month">
                    <div class="date">6</div>
                </li>
            </ul> --}}

        </div><!-- /. calendar -->
    </div><!-- /. wrap -->
    <div class="m-5">
<span> .</span>    </div>
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
