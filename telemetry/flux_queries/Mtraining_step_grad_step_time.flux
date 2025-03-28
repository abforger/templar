from(bucket: "tplr")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r._measurement == "Mtraining_step")
  |> filter(fn: (r) => r._field == "grad_step_time")
  |> filter(fn: (r) => r["uid"] =~ /${uid:regex}/)
  |> filter(fn: (r) => r["role"] =~ /${role:regex}/)
  |> filter(fn: (r) => r["group"] =~ /${group:regex}/)
  |> filter(fn: (r) => r["version"] =~ /${version:regex}/)
  |> group(columns: ["uid", "_field"])
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")
