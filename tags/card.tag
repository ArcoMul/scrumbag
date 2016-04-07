<card>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="row">
                    <div class="col-md-10">
                        <div class="title">{ title }</div>
                    </div>
                    <div class="col-md-2">
                        <div class="points">{ points }</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6 avatars">
                        <div each={ users } class="avatar" title={ name }>
                            { initials }
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .card {
            margin-bottom: 10px;
            background-color: #FFF;
            box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2);
            border-radius: 3px;
            cursor: pointer;
            font-size: 15px;
            line-height: 18px;
            padding: 10px 15px;
        }
        .title {

        }
        .points {
            text-align: right;
            font-weight: bold;
            font-size: 18px;
        }
        .avatars {
            text-align: right;
            margin-top: 5px;
        }
        .avatars .avatar {
            display: inline-block;
            height: 30px;
            width: 30px;
            font-size: 14px;
            line-height: 30px;
            margin: 0 0 5px 5px;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            background-color:#eee;
            border-radius: 3px;
            border: 1px solid #e3e3e3;
        }
    </style>
</card>
