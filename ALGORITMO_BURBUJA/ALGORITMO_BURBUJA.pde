int[] valores;
int i = 0, j = 0;
boolean ordenado = false;

void setup() {
  size(600, 400);
  valores = new int[width / 10];
  for (int i = 0; i < valores.length; i++) {
    valores[i] = int(random(height));
  }
  frameRate(10); // Controla la velocidad de ejecución
}

void draw() {
  background(0);
  
  // Dibujar los valores como barras
  for (int k = 0; k < valores.length; k++) {
    stroke(255);
    if (k == j || k == j + 1) {
      fill(255, 0, 0); // Resalta los valores en comparación
    } else {
      fill(255);
    }
    rect(k * 10, height - valores[k], 10, valores[k]);
  }

  // Algoritmo Bubble Sort paso a paso
  if (!ordenado) {
    if (i < valores.length - 1) {
      if (j < valores.length - i - 1) {
        if (valores[j] > valores[j + 1]) {
          int temp = valores[j];
          valores[j] = valores[j + 1];
          valores[j + 1] = temp;
        }
        j++;
      } else {
        j = 0;
        i++;
      }
    } else {
      ordenado = true;
    }
  }
}
