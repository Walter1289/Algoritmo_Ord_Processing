int[] valores;
color[] colores;
int n = 50;
int i = 0, j = 0;
boolean ordenado = false;
boolean pausado = false;
int algoritmo = 1;
ArrayList<int[]> stack = new ArrayList<int[]>();
int delayCounter = 0;
String[] nombresAlgoritmos = {"Burbuja", "Selección", "Inserción", "Quicksort"};

void setup() {
  size(600, 450);
  iniciarValores();
}

void draw() {
  background(0);
  mostrarValores();
  dibujarBotones();
  fill(50, 50, 50);
  rect(width - 190, 10, 180, 25, 5);
  fill(255);
  textSize(16);
  text("Presione R para reiniciar", width - 180, 28);
  if (!ordenado && !pausado) {
    switch (algoritmo) {
      case 1:
        if (delayCounter % 2 == 0) ordenarBurbuja();
        delayCounter++;
        break;
      case 2:
        if (delayCounter % 10 == 0) ordenarSeleccion();
        delayCounter++;
        break;
      case 3:
        ordenarInsercion();
        break;
      case 4:
        ordenarQuicksort();
        break;
    }
  }
}

void mousePressed() {
  for (int k = 0; k < nombresAlgoritmos.length; k++) {
    if (mouseX > 10 && mouseX < 160 && mouseY > 10 + k * 30 && mouseY < 40 + k * 30) {
      algoritmo = k + 1;
      iniciarValores();
    }
  }
}

void keyPressed() {
  if (key == ' ') pausado = !pausado;
  if (key == 'r' || key == 'R') iniciarValores();
}

void iniciarValores() {
  valores = new int[n];
  colores = new color[n];
  for (int k = 0; k < n; k++) {
    valores[k] = int(random(height - 50));
    colores[k] = color(random(255), random(255), random(255));
  }
  i = 0;
  j = 0;
  ordenado = false;
  stack.clear();
  if (algoritmo == 4) {
    stack.add(new int[]{0, valores.length - 1});
  }
  delayCounter = 0;
}

void mostrarValores() {
  float barWidth = width / float(n);
  for (int k = 0; k < valores.length; k++) {
    fill(colores[k]);
    rect(k * barWidth, height - valores[k], barWidth - 2, valores[k]);
  }
}

void dibujarBotones() {
  for (int k = 0; k < nombresAlgoritmos.length; k++) {
    fill(50);
    if (algoritmo == k + 1) fill(100, 100, 255);
    rect(10, 10 + k * 30, 150, 30, 5);
    fill(255);
    textSize(16);
    text(nombresAlgoritmos[k], 20, 30 + k * 30);
  }
}

void ordenarBurbuja() {
  if (i < valores.length - 1) {
    if (j < valores.length - 1 - i) {
      if (valores[j] > valores[j + 1]) {
        intercambiar(j, j + 1);
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

void ordenarSeleccion() {
  if (i < valores.length - 1) {
    int minIndex = i;
    for (int k = i + 1; k < valores.length; k++) {
      if (valores[k] < valores[minIndex]) {
        minIndex = k;
      }
    }
    intercambiar(i, minIndex);
    i++;
  } else {
    ordenado = true;
  }
}

void ordenarInsercion() {
  if (i < valores.length) {
    int temp = valores[i];
    color tempColor = colores[i];
    int k = i - 1;
    while (k >= 0 && valores[k] > temp) {
      valores[k + 1] = valores[k];
      colores[k + 1] = colores[k];
      k--;
    }
    valores[k + 1] = temp;
    colores[k + 1] = tempColor;
    i++;
  } else {
    ordenado = true;
  }
}

void ordenarQuicksort() {
  if (!stack.isEmpty()) {
    int[] range = stack.remove(stack.size() - 1);
    int low = range[0], high = range[1];
    if (low < high) {
      int pi = particion(low, high);
      stack.add(new int[]{low, pi - 1});
      stack.add(new int[]{pi + 1, high});
    }
  } else {
    ordenado = true;
  }
}

int particion(int low, int high) {
  int pivot = valores[high];
  int i = low - 1;
  for (int k = low; k < high; k++) {
    if (valores[k] < pivot) {
      i++;
      intercambiar(i, k);
    }
  }
  intercambiar(i + 1, high);
  return i + 1;
}

void intercambiar(int a, int b) {
  int temp = valores[a];
  valores[a] = valores[b];
  valores[b] = temp;
  color tempColor = colores[a];
  colores[a] = colores[b];
  colores[b] = tempColor;
}
