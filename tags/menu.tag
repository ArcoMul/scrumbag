<menu>
    <ul>
        <li><a onclick={ onNavigate } href="/epics">epics</a></li>
        <li><a onclick={ onNavigate } href="/board">board</a></li>
    </ul>

    <style>
        menu {
            position: fixed;
            width: 60px;
            height: 100%;
            display: flex !important;
            z-index: 10;
            top: 0;
            background-color: #26386B;
            left: 0;
            margin: 0;
        }
        menu ul {
            list-style: none;
            margin-left: -75px;
            line-height: 30px;
            font-size: 14px;
            text-transform: uppercase;
            text-align: center;
        }
        menu ul li a {
            color: #fff;
        }
        menu ul li a:hover {
            color: #fff;
            text-decoration: underline;
        }
    </style>

    this.onNavigate = function (e) {
        riot.route(e.target.pathname);
    }
</menu>
