<template>
  <v-container>
    <v-dialog v-model="openu" max-width="700">
      <v-card>
        <v-card-title
          class="text-h4 lighten-2 justify-center my-3 light-green--text"
        >
          Sign up
        </v-card-title>
        <v-row no-gutters>
          <v-col cols="1"></v-col>
          <v-col cols="10">
            <v-card-text>
              <v-form ref="form">
                <p v-bind:style="warnStyle" v-html="getMessage"></p>
                <v-text-field
                  label="フルネーム"
                  ref="name"
                  v-model="name"
                  :rules="[rules.requied]"
                  required
                ></v-text-field>
                <v-text-field
                  label="メールアドレス"
                  ref="email"
                  v-model="email"
                  :rules="[rules.requied, rules.email]"
                  required
                ></v-text-field>
                <v-text-field
                  label="パスワード"
                  ref="password"
                  v-model="password"
                  :append-icon="show_pass ? 'mdi-eye-off' : 'mdi-eye'"
                  :rules="[rules.requied, rules.min]"
                  :type="show_pass ? 'password' : 'text'"
                  hint="8文字以上"
                  counter
                  @click:append="show_pass = !show_pass"
                  required
                ></v-text-field>
                <v-text-field
                  label="パスワードの再入力"
                  ref="password_confirmation"
                  v-model="password_confirmation"
                  :append-icon="
                    show_pass_confirmation ? 'mdi-eye-off' : 'mdi-eye'
                  "
                  :rules="[rules.requied, rules.min, rules.match]"
                  :type="show_pass_confirmation ? 'password' : 'text'"
                  hint="8文字以上"
                  counter
                  @click:append="
                    show_pass_confirmation = !show_pass_confirmation
                  "
                  required
                ></v-text-field>
              </v-form>
              <v-card-actions>
                <v-spacer />
                <v-tooltip left>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn
                      v-bind="attrs"
                      v-on="on"
                      class="ma-2"
                      color="red"
                      outlined
                      @click="openu = false"
                      >cancel</v-btn
                    >
                  </template>
                  <div>閉じる</div>
                </v-tooltip>
                <v-spacer />
                <v-tooltip right>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn
                      v-bind="attrs"
                      v-on="on"
                      class="ma-2"
                      color="blue"
                      outlined
                      @click="submit"
                      >Sign up</v-btn
                    >
                  </template>
                  <div>サインアップ(新規登録)する</div>
                </v-tooltip>
                <v-spacer />
              </v-card-actions>
            </v-card-text>
          </v-col>
          <v-col cols="1"></v-col>
        </v-row>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  name: "SignUp",
  data() {
    return {
      openu: false,
      show_pass: true,
      show_pass_confirmation: true,
      formHasErrors: false,
      rules: {
        requied: (value) => !!value || "入力してください",
        min: (v) => v.length >= 8 || "８文字未満です",
        match: (v) =>
          v === this.password ||
          "パスワードと再確認パスワードが一致していません",
        email: (v) => {
          const pattern =
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
          return pattern.test(v) || "適切なメールアドレスではありません";
        },
      },
      message: "",
      warnStyle: {
        color: "#F44336",
      },
    };
  },
  computed: {
    form() {
      return {
        name: null,
        email: null,
        password: null,
        password_confirmation: null,
      };
    },
    getMessage() {
      return this.message;
    },
  },
  methods: {
    open: function () {
      this.show = true;
    },
    cancel: function () {
      Object.keys(this.form).forEach((f) => {
        this.$refs[f].reset();
      });
      this.show = false;
    },
    submit: function () {
      this.formHasErrors = false;

      Object.keys(this.form).forEach((f) => {
        if (!this.form[f]) this.formHasErrors = true;
        this.$refs[f].validate(true);
      });
      if (!this.formHasErrors) return "Can`t Sign Up";

      const url = process.env.VUE_APP_URL + "/api/auth";
      var params = new URLSearchParams();
      params.append("name", this.name);
      params.append("email", this.email);
      params.append("password", this.password);
      params.append("password_confirmation", this.password_confirmation);
      axios.defaults.headers.common["Content-Type"] = "application/json";
      axios.post(url, params).then(
        (response) => {
          localStorage.setItem(
            "access-token",
            response.headers["access-token"]
          );
          localStorage.setItem("client", response.headers["client"]);
          localStorage.setItem("uid", response.headers["uid"]);
          localStorage.setItem("token-type", response.headers["token-type"]);
          this.$router.push("information");
        },
        (error) => {
          this.message = "登録に失敗しました。<br>Failed to SignUp";
          return error;
        }
      );
    },
  },
};
</script>
