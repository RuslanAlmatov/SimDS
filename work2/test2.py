# Вашей команде поручили заняться разработкой сервиса для автоматического отлова ботов и предотвращения DDoS-атак. Для регистрации на сайте необходимо указать email-адрес. Не всегда указанный набор символов является корректным email.

# Вашему коллеге-стажёру поручили выполнить это маленькое задание, в результате чего был разработан код, приведённый ниже:
# Код работает корректно и полностью решает задачу, но после ревью TeamLead`а остались комментарии о том, что его можно ускорить минимум в 2 раза, буквально поменяв две строчки, а какие он не сказал – лишь оставил ссылку на страницу про регулярные выражения в Python в качестве подсказки. 

import re
from typing import List


def valid_emails(strings: List[str]) -> List[str]:
    """Take list of potential emails and returns only valid ones"""

    valid_email_regex = re.compile(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$")

    def is_valid_email(email: str) -> bool:
        return bool(valid_email_regex.fullmatch(email))

    emails = []
    for email in strings:
        if is_valid_email(email):
            emails.append(email)

    return emails


