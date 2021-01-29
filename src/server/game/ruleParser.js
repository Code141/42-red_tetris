class RuleParser {
  constructor(rule) {
    this.rules = rule;
  }

  check(inputRules)
  {
    let parsedRules = {};

    Object.keys(this.rules).forEach(key => {

      let rule = this.rules[key];
     /* OVERWRITE BOOL
      if (!inputRules[key])
        return; ///////// REPLACE WITH THISRULE VALUE;
        */

      let value = inputRules[key];
        /*
         .hasOwnProperty("value"))
        ? inputRules[key].value
        : inputRules[key].values;
        */

      switch (rule.type) {
        case "number" :
          value = this.parseNumber(rule, value);
          break;
        case "bool" :
          value = this.parseBool(rule, value);
          break;
        default:
          console.log("WARNING UNKNOW INPUT TYPE FOR " + key);
          break;
      }

      parsedRules[key] = value;
    });
    console.log(parsedRules);
    console.log(inputRules);
    return parsedRules;
  }

  parseNumber(rule, value) {
    value = parseInt(value);
    return (value <= rule.max && value >= rule.min)
      ? value
      : rule.value;
  }

  parseBool(rule, value) {
    return ((value !== "false" || value !== false)
      && (value === "true" || value === true))
      ? true
      : false
  }

}

export default RuleParser;
