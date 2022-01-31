function setPageTurnAllowance(query, direction) {
  switch(direction) {
    case 'left':
      if (query.offset && query.limit) {
        (Number(query.offset) - Number(query.limit)) > 0;
      } else {
        return false;
      }
    case 'right':
      if (query.offset === Number && query.limit) {
        (Number(query.offset) + Number(query.limit)) < data.rows.length
      } else {
        return false;
      }
    default:
      return false;
  }
}

module.exports = setPageTurnAllowance;
