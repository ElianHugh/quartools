# mdapply works

    Code
      mdapply(input, function(x) {
        div(x$msg, attr = sprintf(".callout-%s", x$type))
      })
    Output
      
      
      :::{.callout-tip}
      
      a tip
      
      :::
      
      
      :::{.callout-warning}
      
      a warning
      
      :::
      
      
      :::{.callout-message}
      
      a message
      
      :::
      

