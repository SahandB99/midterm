  class Note {
  String title;
  String description;

  Note(this.title,this.description, {String content, String note });
  Note.copy(Note from) :this(from.title, from.description);
}
