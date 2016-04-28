var $ = require('jquery');
require('./card.tag');

<column class={ this.colclass }>
    <div class="content">
        <div class="row title">
            <div class="col-md-12">
                <h2>{ title }</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="cards">
                    <card each={ cards } column={ parent }></card>
                </div>
            </div>
        </div>
    <div>

    <style>
        column {
            margin: 10px 0;
        }
        .title h2 {
            padding: 10px 0;
            margin: 0;
            background-color: #eee;
            text-transform: uppercase;
            font-size: 20px;
            font-weight: bold;
            border-radius: 3px 3px 0 0;
            border-bottom: 1px solid #E4E4E4;
            text-align: center;
        }
        .content {
            background-color: #E4E4E4;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            height: calc(100% - 20px);
            border-radius: 3px;
        }
        .cards {
            padding: 10px;
        }
    </style>

    this.on('card-drag', function (card, x, y) {
        console.log('card-drag', card, x, y, this);
        $(this.root).find('.cards').children('card').each(function () {
            if ($(this).hasClass('isClone')) {
                return;
            }
            var _y = $(this).offset().top;
            var _height = $(this).height();
            console.log('y', y);
            if (_y < y && y < _y + height) {
                console.log('Hover over');
            }
        });
    });

    this.on('mount', function(){
        this.colclass = "col-md-" + Math.floor(12 / this.columns.length);
        this.update();
    });

</column>
