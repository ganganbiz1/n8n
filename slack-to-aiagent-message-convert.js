// Loop over input items and add a new field called 'myNewField' to the JSON of each one
let slackMessage
let userName

for (const item of $input.all()) {
  // Slackメッセージをエージェント用に整形
slackMessage = item.json.text || "";
userName = item.json.user_name || "ユーザー";
}

// フォーマットされたプロンプトを作成
const formattedPrompt = `${userName}からのメッセージ: ${slackMessage}`;

// 整形したデータを返す
return {
  json: {
    chatInput: formattedPrompt
  }
};