int[] valores;
int i = 1, j;
boolean ordenado = false;
int key;

void setup() {
  size(600, 400);
  valores = new int[width / 10];
  for (int k = 0; k < valores.length; k++) {
    valores[k] = int(random(height));
  }
  frameRate(10);
  key = valores[i];
  j = i - 1;
}

void draw() {
  background(0);
  
  // Dibujar los valores como barras
  for (int k = 0; k < valores.length; k++) {
    if (k == i) {
      fill(0, 255, 0); // Elemento actual en verde
    } else if (k == j) {
      fill(255, 0, 0); // Comparación en rojo
    } else {
      fill(255);
    }
    rect(k * 10, height - valores[k], 10, valores[k]);
  }

  // Algoritmo Insertion Sort paso a paso
  if (!ordenado) {
    if (i < valores.length) {
      if (j >= 0 && valores[j] > key) {
        valores[j + 1] = valores[j];
        j--;
      } else {
        valores[j + 1] = key;
        i++;
        if (i < valores.length) {
          key = valores[i];
          j = i - 1;
        }
      }
    } else {
      ordenado = true;
    }
  }
}
