from bs4 import BeautifulSoup
import csv

def extract_tables_from_html(html_file):
    with open(html_file, 'r', encoding='utf-8') as file:
        soup = BeautifulSoup(file, 'html.parser')
        tables = soup.find_all('table')
        return tables

def clean_text(cell):
    text = cell.get_text(strip=False)
    text = text.replace(',', 'virgule')
    text = text.replace('ε', '€')

    if '→' in text:
        text = text.split('→')[1].strip()

    if not text:
        text = '§'

    text = ' '.join('&'.join(word.strip() for word in text.split()) for text in text.split('&'))

    return text

def convert_table_to_csv(table, csv_file):
    with open(csv_file, 'w', newline='', encoding='utf-8') as csvfile:
        csv_writer = csv.writer(csvfile)
        for row in table.find_all('tr'):
            csv_writer.writerow([clean_text(col) for col in row.find_all(['th', 'td'])])

def main():
    html_file = 'src/grammaire/Grammophone.html'
    tables = extract_tables_from_html(html_file)

    for i, table in enumerate(tables):
        csv_file = f'src/grammaire/grammaire{i}.csv'
        convert_table_to_csv(table, csv_file)
        print(f'Tableau {i + 1} converti en {csv_file}')

if __name__ == "__main__":
    main()
