describe "RemoteCallsSpec", ->

  it "should add two digits", ->
    expect(1).toBe(1)
    expect(@MyController).not.toBeDefined();

  value = undefined
  flag = undefined

  it "should be async", ->
    runs ->
      flag = false
      value = 0
      setTimeout (->
        flag = true
      ), 500

    waitsFor (->
      value++
      flag
    ), "The Value should be incremented", 750
    runs ->
      expect(value).toBeGreaterThan 0