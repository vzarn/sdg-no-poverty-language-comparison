from pathlib import Path
import time
import pandas as pd
import matplotlib.pyplot as plt

BASE_DIR = Path(__file__).resolve().parents[1]
DATA_PATH = BASE_DIR / "data" / "poverty_sample.csv"
OUTPUT_DIR = BASE_DIR / "outputs"
OUTPUT_DIR.mkdir(exist_ok=True)

def load_and_clean(path):
    df = pd.read_csv(path)
    df = df.dropna(subset=["Country", "Region", "Year", "Poverty_Rate", "Income_Group"])
    df["Year"] = df["Year"].astype(int)
    df["Poverty_Rate"] = df["Poverty_Rate"].astype(float)
    return df

def summarize(df):
    summary = (
        df.groupby(["Region", "Year"], as_index=False)["Poverty_Rate"]
        .mean()
        .rename(columns={"Poverty_Rate": "Mean_Poverty_Rate"})
    )
    return summary

def make_chart(summary):
    pivot = summary.pivot(index="Year", columns="Region", values="Mean_Poverty_Rate")
    ax = pivot.plot(kind="line", marker="o")
    ax.set_title("Average Poverty Rate by Region")
    ax.set_xlabel("Year")
    ax.set_ylabel("Poverty Rate (%)")
    ax.legend(title="Region", bbox_to_anchor=(1.05, 1), loc="upper left")
    plt.tight_layout()
    plt.savefig(OUTPUT_DIR / "poverty_chart_python.png", dpi=300)
    plt.close()

def benchmark(iterations=100):
    start = time.perf_counter()
    for _ in range(iterations):
        load_and_clean(DATA_PATH)
    end = time.perf_counter()
    return end - start

if __name__ == "__main__":
    df = load_and_clean(DATA_PATH)
    summary = summarize(df)

    summary.to_csv(OUTPUT_DIR / "poverty_summary_python.csv", index=False)
    make_chart(summary)

    elapsed = benchmark()

    with open(OUTPUT_DIR / "python_benchmark.txt", "w", encoding="utf-8") as file:
        file.write(f"Load + clean time for 100 loops: {elapsed:.4f} seconds\n")

    print("Python analysis completed.")
    print(summary)
    print(f"Benchmark: {elapsed:.4f} seconds")
