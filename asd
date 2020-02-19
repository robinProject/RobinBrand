<html>
<title>Todo List</title>

<head>
  <link rel="stylesheet" type="text/css"
    href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <style>
    ul.todotasks {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 100%;
      max-width: 500px;
      margin: 0 auto;
      padding-left: 10px;
      padding-right: 10px;
      color: #333;
      height: 90vh;
      margin-top: 5vh;
      margin-bottom: 5vh;
      overflow-y: auto;
    }

    .todo-list {
      list-style: none;
      margin-bottom: 20px;
    }

    .todo-item {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .todoForm {
      margin-top: 10px;
    }

    .done {
      text-decoration: line-through;
    }

    .todo-item div {
      flex-grow: 1;
      margin-left: 10px;
      margin-right: 10px;
      font-size: 22px;
    }

    .header {
      background-color: #f44336;
      padding: 12px 40px;
      color: white;
    }

    .delete-todo {
      border: none;
      padding: 8px;
    }

    .daytitle {
      font-weight: bold;
      font-size: 20px;
    }

    .childLength {
      float: right;
      padding-top: 3px;
    }
  </style>
</head>

<body>
  <div class='container'>
    <div class="todoList">
      <div id="" class="header">
        <div>
          <span class="daytitle">Wednesday 10th</span>
          <span class="childLength"></span>
        </div>
        <div>
          <span>Dinner checklist</span>
          <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
        </div>
      </div>
      <ul class="todotasks list-group"></ul>
    </div>
    <form class="todoForm">
      <div class="form-group">
        <input type="text" class="form-control" id="enterTask" aria-describedby="emailHelp">
      </div>
    </form>
    <button class="btn btn-success" style="float:right;" onclick="addList()">Add</button>

  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous">
  </script>
  <script>
    var list = ['Pepper', "Eggs", "Onion"];
    let childLength = document.getElementsByClassName('childLength')[0];
    childLength.innerText = list.length + " Tasks"
    for (var i = 0; i < list.length; i++) {
      addTodoList(list[i])
    }

    function addTodoList(text) {
      var _ulEl = document.getElementsByClassName('todotasks')[0];
      var div = document.createElement('div');
      var _liEl = document.createElement('li');
      _liEl.classList.add("todo-item");
      _liEl.classList.add("list-group-item");

      var checkbox = document.createElement('input');
      checkbox.type = "checkbox";
      checkbox.className = "selected";
      checkbox.onclick = selectTodo;
      div.className = "taskName";
      var todoList = document.getElementsByClassName('todoList')[0];
      var _editIcon = document.createElement('span');
      var _deleteIcon = document.createElement('span');
      _deleteIcon.onclick = deleteTask;
      _deleteIcon.classList.add("delete-todo")
      _editIcon.onclick = editTask;
      _editIcon.classList.add("edit")
      _deleteIcon.innerHTML = '<i class="fa fa-trash-o" aria-hidden="true"></i>';
      _editIcon.innerHTML = '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
      div.innerHTML = text
      _liEl.appendChild(checkbox);
      _liEl.appendChild(div);
      _liEl.appendChild(_editIcon);
      _liEl.appendChild(_deleteIcon);
      _ulEl.appendChild(_liEl)
      todoList.append(_ulEl);
    };

    function addList() {
      let input = document.getElementById('enterTask');
      let text = input.value.trim();
      if (text == "") {
        alert("Enter your task");
        return;
      } else {
        input.value = "";
        input.focus();
        addTodoList(text);
        list.push(text);
        childLength.innerText = list.length + " Tasks";
      }
    }

    const _todoForm = document.getElementsByClassName('todoForm')[0];
    _todoForm.addEventListener('submit', (event) => {
      event.preventDefault();
      let input = document.getElementById('enterTask');
      let text = input.value.trim();
      if (text == "") {
        alert("Enter your task");
        return;
      } else {
        input.value = "";
        input.focus();
        addTodoList(text);
        list.push(text);
        childLength.innerText = list.length + " Tasks";
      }
    });

    function selectTodo() {
      if (this.checked) {
        this.parentElement.classList.add('done');
      } else {
        this.parentElement.classList.remove('done');
      }
    };

    function deleteTask() {
      var div = this.parentElement;
      div.remove();
    };

    function editTask() {
      this.previousElementSibling.contentEditable = true;
      this.previousElementSibling.focus();
    };
  </script>
</body>

</html>
