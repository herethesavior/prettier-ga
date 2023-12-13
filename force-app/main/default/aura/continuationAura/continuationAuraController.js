({
  callContinuation: function (cmp) {
    var action = cmp.get("c.startRequest");
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        console.log(
          "From server: " +
            response.getReturnValue() +
            "\n" +
            JSON.stringify(response.getReturnValue())
        );
      } else if (state === "INCOMPLETE") {
        alert("Continuation action is INCOMPLETE");
      } else if (state === "ERROR") {
        var errors = response.getError();
        if (errors) {
          if (errors[0] && errors[0].message) {
            console.log("Error message: " + errors[0].message);
          }
        } else {
          console.log("Unknown error");
        }
      }
    });
    // Enqueue action that returns a continuation
    $A.enqueueAction(action);
  },
});
