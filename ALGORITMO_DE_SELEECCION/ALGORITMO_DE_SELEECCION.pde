int[] valores;
int i = 0, j = 0, minIdx;
boolean ordenado = false;

void setup() {
  size(600, 400);
  valores = new int[width / 10];
  for (int k = 0; k < valores.length; k++) {
    valores[k] = int(random(height));
  }
  frameRate(10);
  minIdx = i;
}

void draw() {
  background(0);
  
  // Dibujar los valores como barras
  for (int k = 0; k < valores.length; k++) {
    if (k == i) {
      fill(0, 255, 0); // Índice actual en verde
    } else if (k == minIdx) {
      fill(255, 0, 0); // Índice mínimo en rojo
    } else {
      fill(255);
    }
    rect(k * 10, height - valores[k], 10, valores[k]);
  }

  // Algoritmo Selection Sort paso a paso
  if (!ordenado) {
    if (i < valores.length - 1) {
      if (j < valores.length) {
        if (valores[j] < valores[minIdx]) {
          minIdx = j;
        }
        j++;
      } else {
        // Intercambiar valores
        int temp = valores[i];
        valores[i] = valores[minIdx];
        valores[minIdx] = temp;
        i++;
        j = i;
        minIdx = i;
      }
    } else {
      ordenado = true;
    }
  }
}
