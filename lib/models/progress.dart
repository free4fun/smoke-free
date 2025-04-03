class Progress {
  static int calculateProgressRate(
      // % de reducción = [(Cigarrillos fumados en el último día o número de días sin fumar) / (Cantidad de cigarrillos que fumaba antes de intentar dejar de fumar)] x 100
      int qtyUsedToSmoke,
      int qtyLastDaySmoked,
      int qtyDaysWithoutSmoke) {
    int rate = 0;
    if (qtyDaysWithoutSmoke > 0) {
      rate = 100 - ((qtyDaysWithoutSmoke / qtyUsedToSmoke) * 100).toInt();
    } else if (qtyLastDaySmoked >= 0) {
      rate = 80 - ((qtyLastDaySmoked / qtyUsedToSmoke) * 100).toInt();
    }
    if (rate < 0) {
      rate = 0;
    }
    return rate;
  }

  static int averageSmoked(List smokedPerDay) {
    // Media = Suma de los valores / cantidad de valores
    int sum = 0;
    int qty = smokedPerDay.length;
    for (int smoked in smokedPerDay) {
      sum += smoked;
    }
    return sum % qty;
  }
}
