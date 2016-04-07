require('./menu.tag');
require('./board.tag');
require('./epics.tag');

<app>
    <menu></menu>
    <page></page>

    <style>
        app {
            padding-left: 60px;
            display: block;
        }
        app .container-fluid {
            background-color: #516DBD;
        }
    </style>

    var arco = {
        username: 'arco',
        name: 'Arco'
    };
    var henk = {
        username: 'henk',
        name: 'Henk'
    };
    var diederik = {
        username: 'diederik',
        name: 'Diederik'
    };

    this.users = [arco, henk, diederik];

    this.users.forEach(function (user) {
        user.initials = user.name.substr(0, 2);
    });

    this.columns = columns = [];
    this.columns.push({
        title: "todo",
        cards: [
            {
                title: "As a user I want no war so that I have peace",
                points: 5,
                users: [arco, henk]
            },
            {
                title: "As a user I want sun so that I can chill",
                points: 3,
                users: [diederik]
            }
        ],
        columns: columns
    });
    this.columns.push({
        title: "in progress",
        columns: columns
    });
    this.columns.push({
        title: "testing",
        columns: columns
    });
    this.columns.push({
        title: "done",
        columns: columns
    });

    var self = this;

    riot.route('/board', function(name) {
        riot.mount('page', 'board', {columns: self.columns});
    });

    riot.route('/epics', function(name) {
        riot.mount('page', 'epics');
    });

    this.on('mount', function(){
        riot.route('/board');
    });
</app>
