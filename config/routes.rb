Rails.application.routes.draw do
  # Courses Routes
  get("/courses", { controller: "courses", action: "index" })
  get("/courses/:id", { controller: "courses", action: "show" })
  post("/insert_course", { controller: "courses", action: "create" })
  get("/delete_course/:id", { controller: "courses", action: "destroy" })
  post("/update_course/:id", { controller: "courses", action: "update" })
  
  # Departments Routes
  get("/departments", { controller: "departments", action: "index" })
  get("/departments/:id", { controller: "departments", action: "show" })
  
  # Students Routes
  get("/students", { controller: "students", action: "index" })
  get("/students/:id", { controller: "students", action: "show" })
end
