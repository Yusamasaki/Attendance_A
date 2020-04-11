
# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true,
              employee_number: "employee_number",
              uid: 1
            )
User.create!( name: "上長A",
              email: "superiorA@email.com",
              password: "password",
              password_confirmation: "password",
              admin: false,
              employee_number: "employee_number",
              uid: 2
            )
User.create!( name: "上長B",
              email: "superiorB@email.com",
              password: "password",
              password_confirmation: "password",
              admin: false,
              employee_number: "employee_number",
              uid: 3
            )
User.create!( name: "上長C",
              email: "superiorC@email.com",
              password: "password",
              password_confirmation: "password",
              admin: false,
              employee_number: "employee_number",
              uid: 4
            )
User.create!( name: "一般A",
              email: "generalA@email.com",
              password: "password",
              password_confirmation: "password",
              admin: false,
              employee_number: "employee_number",
              uid: 5
            )
User.create!( name: "一般B",
              email: "generalB@email.com",
              password: "password",
              password_confirmation: "password",
              admin: false,
              employee_number: "employee_number",
              uid: 6
            )