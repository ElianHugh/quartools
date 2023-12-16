# with_*() output is as expected

    Code
      with_body_column("foo", .attributes = ".bar")
    Output
      
      ::: {.column-body .bar}
      foo
      ::: 
      

---

    Code
      with_page_column("foo", .attributes = ".bar")
    Output
      
      ::: {.column-page .bar}
      foo
      ::: 
      

---

    Code
      with_screen_inset_column("foo", .attributes = ".bar")
    Output
      
      ::: {.column-screen-inset .bar}
      foo
      ::: 
      

---

    Code
      with_screen_column("foo", .attributes = ".bar")
    Output
      
      ::: {.column-screen .bar}
      foo
      ::: 
      

---

    Code
      with_margin_column("foo", .attributes = ".bar")
    Output
      
      ::: {.column-margin .bar}
      foo
      ::: 
      

---

    Code
      with_body_column("foo", .attributes = ".bar", extension = "left")
    Output
      
      ::: {.column-body-left .bar}
      foo
      ::: 
      

---

    Code
      with_page_column("foo", .attributes = ".bar", extension = "right")
    Output
      
      ::: {.column-page-right .bar}
      foo
      ::: 
      

---

    Code
      with_screen_inset_column("foo", .attributes = ".bar", extension = "shaded")
    Output
      
      ::: {.column-screen-inset-shaded .bar}
      foo
      ::: 
      

---

    Code
      with_screen_column("foo", .attributes = ".bar", extension = "left")
    Output
      
      ::: {.column-screen-left .bar}
      foo
      ::: 
      

