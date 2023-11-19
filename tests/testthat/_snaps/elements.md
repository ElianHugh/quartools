# element output is accurate

    Code
      div("Hello world!")
    Output
      
      
      :::{}
      
      Hello world!
      
      :::
      

---

    Code
      div("This is a tip!", attr = ".callout-tip")
    Output
      
      
      :::{.callout-tip}
      
      This is a tip!
      
      :::
      

---

    Code
      span()
    Output
      []{}

---

    Code
      span("Hello world!", attr = ".bold")
    Output
      [Hello world!]{.bold}

