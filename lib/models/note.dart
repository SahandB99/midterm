  class Note {
  String title;
  String description;

  Note(this.title,this.description);
  Note.copy(Note from) :this(from.title, from.description);
}
