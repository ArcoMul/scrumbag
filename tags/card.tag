var $ = require('jquery');

<card onmousedown={ onMouseDown } class={ showEmptySpace: showEmptySpace }>
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
        card {
            display: block;
        }
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
        .showEmptySpace .card > div {
            opacity: 0;
        }
        .showEmptySpace .card {
            box-shadow: none;
            border: 3px dashed #516DBD;
            background-color: #D2D2D2;
            margin-top: -3px;
            margin-bottom: 7px;
        }
        card.isDragging {
            position: fixed;
            z-index: 1;
        }
    </style>

    var self = this;

    console.log('card', this);

    this.onMouseDown = function (e) {
        var $card = $(e.target).parents('card');
        var $clone = $card.clone();
        $clone.addClass('isClone');
        self.$draggable = $card.after($clone).next();
        self.$draggable.addClass('isDragging').width($card.width()).height($card.height());
        console.log('$card', $card, e.pageX, $card.offset().left);
        self.$draggable.css({
            left: e.pageX,
            top: e.pageY,
            marginLeft: -(e.pageX-$card.offset().left),
            marginTop: -(e.pageY-$card.offset().top)
        });
        $(window).mousemove(self.onDrag);
        $(window).mouseup(self.onDragEnd);
        self.showEmptySpace = true;
    }

    this.onDrag = function (e) {
        // console.log('mousemove', e);
        self.$draggable.css({left: e.pageX, top: e.pageY});
        console.log('column', self.opts.column);
        self.opts.column.trigger('card-drag', self, e.pageX, e.pageY);
    }

    this.onDragEnd = function (e) {
        $(window).unbind('mousemove', self.onDrag);
        $(window).unbind('mouseup', self.onDragEnd);
        console.log('mousemove', e);
        self.$draggable.css({left: e.pageX, top: e.pageY});
        this.isDragging = false;
    }
</card>
