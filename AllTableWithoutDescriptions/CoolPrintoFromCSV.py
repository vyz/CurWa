import csv


def main():
    fo = open("altawd01.txt", mode='w', encoding='utf-8-sig')
    with open('atwd.csv', encoding='utf-8-sig') as f:
        rr = csv.reader(f, delimiter=';')
        i = 1
        formatto = "{i:>3}  {0:<{fill_width}}   {1:>4}   {2:>2}\n"
        for row in rr:
            fo.write(formatto.format(i=i, fill_width=22, *row))
            i = i+1
    fo.close()


if __name__ == '__main__':
    main()
