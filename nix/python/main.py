import numpy as np
import scipy
import matplotlib.pyplot as plt
import matplotlib
import pandas as pd
import torch
import cv2

matplotlib.use("tkagg")


def main():
    print("Hello from hello!")
    print("Numpy:", np.__version__)
    print("Scipy", scipy.__version__)
    print("Pandas", pd.__version__)
    print("Pytorch rand:", torch.rand(5, 3))
    print("Cv2:", cv2.__version__)

    plt.plot([1, 2, 3, 4])
    plt.ylabel("some numbers")
    plt.show()


if __name__ == "__main__":
    main()
