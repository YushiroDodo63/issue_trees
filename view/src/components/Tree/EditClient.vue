<template>
  <v-dialog persistent v-model="editClientDialog" width="700">
    <v-card>
      <v-card-title class="text-h4 lighten-2">
        <v-row>
          <v-col cols="3" />
          <v-col cols="6" class="my-3 light-green--text"> Edit Client </v-col>
          <v-col cols="1" class="text-end my-3">
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  class="mx-2"
                  fab
                  text
                  v-bind="attrs"
                  v-on="on"
                  @click="changeClientDialog()"
                >
                  <v-icon>mdi-arrow-left-top</v-icon>
                </v-btn>
              </template>
              <span>issueを追加する</span>
            </v-tooltip>
          </v-col>
          <v-col cols="2" class="text-end my-3">
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  class="mx-2"
                  fab
                  text
                  v-bind="attrs"
                  v-on="on"
                  @click="closeDialog()"
                >
                  <v-icon>mdi-close</v-icon>
                </v-btn>
              </template>
              <span>ダイアログを閉じる</span>
            </v-tooltip>
          </v-col>
        </v-row>
      </v-card-title>
      <v-row no-gutters>
        <v-col cols="1" />
        <v-col cols="10">
          <v-card-title class="text-left">
            <v-icon class="mr-3">mdi-tag-text-outline</v-icon> Client Name
          </v-card-title>
          <v-text-field v-model="clientName" label="client name" solo>
          </v-text-field>
          <v-card-actions>
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  class="ma-2"
                  text
                  outlined
                  color="red"
                  v-bind="attrs"
                  v-on="on"
                  @click="deleteClient()"
                >
                  delete
                </v-btn>
              </template>
              <span>このClientを削除する</span>
            </v-tooltip>
            <v-spacer></v-spacer>
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  class="ma-2"
                  text
                  outlined
                  color="blue"
                  v-bind="attrs"
                  v-on="on"
                  @click="editClient()"
                >
                  edit
                </v-btn>
              </template>
              <span>このClientを編集する</span>
            </v-tooltip>
          </v-card-actions>
        </v-col>
      </v-row>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
export default {
  props: {
    editClientDialog: Boolean,
    clientName: String,
    projectId: Number,
    clientId: Number,
  },
  name: "App",
  data() {
    return {
      // client infomation
      // clientName: [],
    };
  },
  methods: {
    editClient: function () {
      const url = process.env.VUE_APP_URL;
      var params = {
        name: this.clientName,
        project_id: this.projectId,
      };
      axios.defaults.headers.common["Content-Type"] = "application/json";
      axios
        .put(
          url + "/clients/" + this.clientId,
          { client: params },
          {
            headers: {
              "access-token": localStorage.getItem("access-token"),
              client: localStorage.getItem("client"),
              uid: localStorage.getItem("uid"),
            },
          }
        )
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error.response);
        });
      this.editClientDialog = false;
      this.$emit("editClient");
    },
    deleteClient: function () {
      const url = process.env.VUE_APP_URL;
      console.log(this.clientId);
      axios.delete(url + "/clients/" + this.clientId);
      this.editClientDialog = false;
      this.$emit("deleteClient");
    },
    changeClientDialog: function () {
      this.$emit("changeClientDialog");
    },
    closeDialog: function () {
      this.editClientDialog = false;
      this.$emit("closeDialog");
    },
  },
};
</script>
