class ToDo {
  String? id;
   String? todoText;
   bool isDone;

   ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
   });
   static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Checking Plymouth DLE Contents', isDone: true),
      ToDo(id: '02', todoText: 'Cheking Project reports', isDone: true),
      ToDo(id: '03', todoText: 'Team Meeting', isDone: true),
      ToDo(id: '04', todoText: 'Checking bug reports', ),
      ToDo(id: '05', todoText: 'Working on Mobile App Project 2 hours', ),
      ToDo(id: '06', todoText: 'Working on social media Project 3 hours', ),
      ToDo(id: '07', todoText: 'Break time', ),
      ToDo(id: '08', todoText: 'Working on SDTP Project 3 hours', ),
    ];
   }
}