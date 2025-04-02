int[] valores;
ArrayList<int[]> stack = new ArrayList<int[]>(); 
boolean ordenado = false;

void setup() {
  size(600, 400);
  valores = new int[width / 10];
  for (int i = 0; i < valores.length; i++) {
    valores[i] = int(random(height));
  }
  frameRate(10);
  
  // Inicializar el stack con el primer rango
  stack.add(new int[]{0, valores.length - 1});
}

void draw() {
  background(0);
  
  // Dibujar los valores como barras
  for (int k = 0; k < valores.length; k++) {
    fill(255);
    rect(k * 10, height - valores[k], 10, valores[k]);
  }

  // Algoritmo Quicksort paso a paso
  if (!ordenado && stack.size() > 0) {
    int[] range = stack.remove(stack.size() - 1);
    int low = range[0], high = range[1];

    if (low < high) {
      int pivotIndex = partition(valores, low, high);
      stack.add(new int[]{low, pivotIndex - 1});
      stack.add(new int[]{pivotIndex + 1, high});
    }
  } else {
    ordenado = true;
  }
}

int partition(int[] arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1;
  
  for (int j = low; j < high; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  
  return i + 1;
}
