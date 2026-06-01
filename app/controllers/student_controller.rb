class StudentController < ApplicationController
  def index
    @students = [
      {name: "Jorge", course: "ADS", age: 25},
      {name: "Claudio", course: "Nutrição", age: 19},
      {name: "Arthur", course: "Engenharia de Software", age: 21},
      {name: "Robson", course: "Desempregado", age: 48},
      {name: "Caroline", course: "Engenharia de Bioprocessos", age: 21}
    ]
  end
end
