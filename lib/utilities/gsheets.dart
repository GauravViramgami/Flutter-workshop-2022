import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-workshop-2022",
  "private_key_id": "707afb491a0252c655bd83a4f17ac4fca9526e70",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzhGvhYwAdAH8g\nz6of3xG8oXbzRTR7w+aLE5hRnNIDKeXd1iTeotTmahVVi4lb+SCmPJXfcv3skcc3\nY14slDcCT7e1OYyjWz9UsIvAcU2lTI5GJswTJAMf89QmsTH2pOnXBLIFTxLmeC7p\nENNNXsL/4gpzsT1Qk3c6KUlOSrKsP7kkuATIP96D017NdB0+OVEHsFRrTGvSF922\nWPPFz+jQl8b+2GXIkbF5WVR9vhlx1Cd7eq2AuKsJfgwbhWQ+RulzXL9OJDB4dJQe\nyqAAj1gZQuDALwY63BYLPUzleMJVga2+qBukEvQEUo8SFXVlWT0PwPEYjZ+0Wu8C\n7gZj88KpAgMBAAECggEAJpShTctl0RXT/JR80sQxbumBo7c+GBJKWB3yOKn8HZdx\n0jsNafazTEDEzIGEWAqi2G9BY4g2Z9MNrkryCKEi8GF7ERzo64u3AOe/ZTDEl++r\nzQpWBhARhtqzf8xJuWEIa4BUFR2BKZxvMoI9800YGf+1sNcI3yoOL+cDHOsjWq6r\nCi712fqOseptpSzTbDbP1zPAE7zrC0fLf0tp1NtYiRzNFfZUGiGZh24NwbffQbbY\nlkk67F9AqRqHZo9f6Vm4TvJ7shBqrHesCngcVGRa5UUP/dXjlZaYmw12QF2QN93i\neEFasEHK+YuKyGxgs4lALfZ/oqU1Y9aU3ClD7W2SvQKBgQD6BJM12KRfSlkebbFC\nZSNluCFqAvquI9awS5PcNsQ9QkHdBem0O2qa8dxZlRu2QW+dxu8nE6OG8JQHayec\n7cPHRFmNsGwIZFJNTBITj5qMcH/duxZ3EXzlo7EkXg+4igzFencgm24wVFPmalTI\nzX+DYMYKvVV9czyY1RWE8IwgZQKBgQC30AMAPRZkrMSqiU+xI3vIqJhB5qLH/Lsm\nPsEp7fJbn+fGV9/pOD3F3Efj3I8Miheoit3wXs1o+gjk6WM1hfJFOlXN48jbDoZj\nX+OBhasqR5KVHQbB8eRN5XjSrLgh/g5QJHW0MlD2EHiTSlcfBQ9acrhLEdn13AH3\nH/rdfSya9QKBgB4w8z3rXV4MclqUUHV+FRoxdAeDOJZSyZgcaEyNaIElQSLZlfEn\nw6XWUw+WS/RkToA1B6gmXPbsklObAvuWUq/7dvz/MuyIgM/Iwd4O11DiPO6fqwTR\n3c01SSzlFuzn7sbiFQShAFths4f9iyN8fUt2IjQlzO8LPWQPRzv4eFNpAoGBALZi\ni9e8xW93jly4in51eumLgChDtNlDCF/WfMwh8gzACbZgkyhSSdj9zcdmnfoPO5Jc\n2AMdziuPjSu1+F6vXckbLPBySGYzb11DU/a8ry3wfp2+g2oFnkc8njpMbxgrggA7\nbR8znenKRhm/9dotpyJUGlFCkUbG2pxe+wiyn4PRAoGAF0QsMjpX+sxOGYAESab5\nnQnyZ2y8swc77KGfWujgMgXVaQHxb0qWfS7+aV/4IY8yJq0Ow26BAwD71Kxs02z/\nP+aZH5yFW3gnX6znxpl/apOGmpA2N+qKZ6yn5sUqgK03shpYmfYpT5iP6lSh7ZKL\nv5J88zL8CQN0pdaCVe00rKI=\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-workshop-2022@flutter-workshop-2022.iam.gserviceaccount.com",
  "client_id": "100870095169993018705",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-workshop-2022%40flutter-workshop-2022.iam.gserviceaccount.com"
}
''';

final gsheets = GSheets(_credentials);

class GSheet {
  late String spreadSheetId;
  
  GSheet (String id) {
    this.spreadSheetId = id;
  }

  Future<List> readData (String sheetName) async {
    var returnval;
    final ss = await gsheets.spreadsheet(spreadSheetId);
    var sheet = ss.worksheetByTitle(sheetName);
    await sheet?.values.allRows().then((value) {
      returnval = value;
    });
    return returnval;
  }
}