String textTranslate(String _type) {
  switch (_type) {
    case 'Hr':
      return 'Heart Rate';
    case 'Spo2':
      return 'Oxygen Saturation';
    case 'BodyTemp':
      return 'Body Temperature';
    case 'RR':
      return 'Respiratory Rate';
    default:
      return '???';
  }
}