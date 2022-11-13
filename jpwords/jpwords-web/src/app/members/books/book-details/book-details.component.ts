import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PageInfo, PageInput } from 'src/app/services';
import { BookService } from 'src/app/services/api/book.service';
import { LessonService } from 'src/app/services/api/lesson.service';
import { WordService } from 'src/app/services/api/word.service';

declare var bootstrap:any

@Component({
  templateUrl: './book-details.component.html',
  styles: [
  ]
})
export class BookDetailsComponent implements OnInit {

  book:any

  lessons:any[] = []
  lessonPage?:PageInfo
  targetLesson:any

  words:any[] = []
  wordsPage?:PageInfo
  targetWord:any
  lessonForWord:any

  bookEditDialog:any
  lessonEditDialog:any
  wordEditDialog:any

  constructor(
    private route:ActivatedRoute,
    private bookService:BookService,
    private lessonService:LessonService,
    private wordService:WordService) { }

  ngOnInit(): void {
    this.route.queryParams.subscribe(param => {
      if(param['id']) {
        this.loadBookData(Number.parseInt(param['id']))
      }
    })

    this.bookEditDialog = new bootstrap.Modal('#bookEditModal', { backdrop : false })
    this.lessonEditDialog = new bootstrap.Modal('#lessonEditModal', { backdrop: false })
    this.wordEditDialog = new bootstrap.Modal('#wordEditModal', { backdrop: false })
  }

  editBook() {
    this.bookEditDialog.show()
  }

  saveBook(data:any) {
    if(data) {
      this.bookService.save(data).subscribe(result => this.book = result)
    }
  }

  editLesson(data:any) {
    this.targetLesson = data ? data : { bookId : this.book.id }
    this.lessonEditDialog.show()
    return false
  }

  saveLesson(data:any) {
    this.lessonService.save(data).subscribe(result => {
      this.loadLessons(result)
      this.lessonEditDialog.hide()
    })
  }

  editWord(data:any) {
    if(!this.noLessonForWord) {
      this.targetWord = data ? data : { lessonId : this.targetLesson.id }
      this.wordEditDialog.show()
    }
  }

  saveWord(data:any) {
    this.wordService.save(data).subscribe(() => {
      this.loadWords()
      this.wordEditDialog.hide()
    })
  }

  selectLesson(lesson:any) {
    this.lessonForWord = lesson
    this.loadLessons(lesson)
  }

  uploadLesson(files:FileList | null) {
    if(files && files.length > 0) {
      this.lessonService.upload(this.book.id, files[0]).subscribe(result => {
        this.lessons = result
      })
    }
  }

  uploadWord(files:FileList | null) {
    if(files && files.length > 0) {
      this.wordService.upload(this.lessonForWord.id, files[0]).subscribe(result => {
        this.words = result
      })
    }
  }

  private loadBookData(id:any) {
    this.bookService.findById(id).subscribe(result => {
      this.book = result
      this.loadLessons(null)
    })
  }

  private loadLessons(lesson:any) {
    if(lesson) {
      this.targetLesson = lesson
    }

    this.lessonService.search({bookId: this.book.id}, PageInput).subscribe(data => {
      const {result, page} = data
      this.lessons = result
      this.lessonPage = page

      if(null == this.targetLesson && result.length > 0) {
        this.targetLesson = result[0]
        this.lessonForWord = this.targetLesson
      }

      this.loadWords()
    })
  }

  loadLessonPage(page:number) {
    const {...header} = PageInput
    header.current = page.toString()

    this.lessonService.search({bookId: this.book.id}, header).subscribe(data => {
      const {result, page} = data
      this.lessons = result
      this.lessonPage = page

      if(null == this.targetLesson && result.length > 0) {
        this.targetLesson = result[0]
        this.lessonForWord = this.targetLesson
      }
      this.loadWords()
    })
  }

  private loadWords() {
    this.targetWord = null
    this.words = []

    if(null != this.targetLesson) {
      this.wordService.search({lessonId: this.targetLesson.id}, PageInput).subscribe(data => {
        const {result, page} = data
        this.words = result
        this.wordsPage = page
      })
    }
  }

  loadWordsPage(page:number) {
    const {...header} = PageInput
    header.current = page.toString()

    if(null != this.targetLesson) {
      this.wordService.search({lessonId: this.targetLesson.id}, header).subscribe(data => {
        const {result, page} = data
        this.words = result
        this.wordsPage = page
      })
    }
  }

  get noLessonForWord():boolean {
    return null == this.lessonForWord || this.lessonForWord.id == undefined || this.lessonForWord.id == 0
  }

}
